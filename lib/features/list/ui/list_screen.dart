import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_saves_backup/core/l10n/l10n_extension.dart';
import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:game_saves_backup/core/sync/state/backup_items_state.dart';

class ListScreen extends ConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.listScreenTitle),
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
            ref.read(backupItemsProvider.notifier).add(BackupItem(
                  path: directoryPath,
                  folderName: directoryPath.split('/').last,
                ));
          }
        },
      ),
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

class _BackupItemTile extends ConsumerWidget {
  const _BackupItemTile({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BackupItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: UniqueKey(),
      background: const ColoredBox(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) => ref.read(backupItemsProvider.notifier).remove(item),
      child: ListTile(
        title: Text(item.folderName),
        trailing: IconButton(
          icon: const Icon(Icons.folder),
          onPressed: () {},
        ),
        subtitle: Text(item.path),
      ),
    );
  }
}
