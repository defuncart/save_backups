import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_saves_backup/core/extensions/theme_extensions.dart';
import 'package:game_saves_backup/core/l10n/l10n_extension.dart';
import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:game_saves_backup/core/sync/state/backup_items_state.dart';
import 'package:game_saves_backup/core/sync/state/sync_items_state.dart';
import 'package:native_context_menu/native_context_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.listScreenTitle),
        actions: const [
          _SyncDirAction(),
        ],
      ),
      body: const _ListScreenContent(),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(Icons.add),
        onPressed: () async {
          final directoryPath = await getDirectoryPath(
            initialDirectory: 'Desktop/',
            confirmButtonText: context.l10n.listScreenNewBackupItemSelectText,
          );
          if (directoryPath != null) {
            ref.read(backupItemsProvider.notifier).add(
                  path: directoryPath,
                );
          }
        },
      ),
    );
  }
}

class _SyncDirAction extends ConsumerWidget {
  const _SyncDirAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncDirectory = ref.watch(syncDirectoryControllerProvider);

    return syncDirectory.map(
      data: (data) => IconButton(
        icon: const Icon(Icons.backup),
        onPressed: () async {
          final directoryPath = await getDirectoryPath(
            initialDirectory: data.value,
            confirmButtonText: context.l10n.listScreenNewBackupItemSelectText,
          );
          if (directoryPath != null) {
            ref.read(syncDirectoryControllerProvider.notifier).setPath(
                  directoryPath,
                );
          }
        },
      ),
      error: (_) => const SizedBox.shrink(),
      loading: (_) => const SizedBox.shrink(),
    );
  }
}

class _ListScreenContent extends ConsumerWidget {
  const _ListScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backupItems = ref.watch(backupItemsProvider);

    return Center(
      child: backupItems.isEmpty
          ? Text(context.l10n.listScreenNoBackupItems)
          : ListView(
              children: backupItems
                  .map((item) => _BackupItemTile(
                        item: item,
                      ))
                  .toList(),
            ),
    );
  }
}

class _BackupItemTile extends ConsumerStatefulWidget {
  const _BackupItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BackupItem item;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __BackupItemTileState();
}

class __BackupItemTileState extends ConsumerState<_BackupItemTile> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  var _hasUnsavedChanges = false;

  BackupItem get _item => widget.item;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController()
      ..text = _item.folderName
      ..addListener(() {
        final text = _controller.text.trim();
        if (_item.folderName != text && !_hasUnsavedChanges) {
          setState(() => _hasUnsavedChanges = true);
          // _focusNode.requestFocus();
        } else if (_item.folderName == text && _hasUnsavedChanges) {
          setState(() => _hasUnsavedChanges = false);
          // _focusNode.requestFocus();
        }
      });
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant _BackupItemTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.item.id != widget.item.id) {
      _controller.text = widget.item.folderName;
    }
  }

  @override
  Widget build(BuildContext context) {
    onRemove() => ref.read(backupItemsProvider.notifier).remove(_item);

    return ContextMenuRegion(
      onDismissed: () {},
      onItemSelected: (item) {
        if (item.title == context.l10n.listScreenBackupItemEdit) {
          _focusNode.requestFocus();
        } else if (item.title == context.l10n.listScreenBackupItemRemove) {
          onRemove();
        }
      },
      menuItems: [
        MenuItem(title: context.l10n.listScreenBackupItemEdit),
        MenuItem(title: context.l10n.listScreenBackupItemRemove),
      ],
      child: Dismissible(
        key: Key(_item.id),
        background: const ColoredBox(
          color: Colors.red,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (_) => onRemove(),
        child: ListTile(
          isThreeLine: _hasUnsavedChanges,
          title: TextField(
            controller: _controller,
            onEditingComplete: () {
              final text = _controller.text.trim();
              if (text.isNotEmpty) {
                ref.read(backupItemsProvider.notifier).updateName(
                      item: _item,
                      folderName: text,
                    );
                _focusNode.unfocus();
                setState(() => _hasUnsavedChanges = false);
              }
            },
            focusNode: _focusNode,
            decoration: InputDecoration.collapsed(
              hintText: context.l10n.listScreenBackupItemNameHintText,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.folder),
            // TODO: Does not seem to work on Arch
            onPressed: () => launchUrl(Uri.directory(_item.path)),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(_item.path),
              if (_hasUnsavedChanges)
                Text(
                  context.l10n.listScreenBackupItemNameUnsavedChangesWarning,
                  style: context.textTheme.labelSmall?.apply(
                    color: context.colorScheme.error,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
