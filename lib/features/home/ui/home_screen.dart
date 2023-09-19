import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_saves_backup/core/l10n/l10n_extension.dart';
import 'package:game_saves_backup/core/sync/state/backup_items_state.dart';
import 'package:game_saves_backup/features/list/ui/list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const _HomeScreenContent(),
      floatingActionButton: FloatingActionButton.small(
        child: const Icon(Icons.settings),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ListScreen(),
          ),
        ),
      ),
    );
  }
}

class _HomeScreenContent extends ConsumerWidget {
  const _HomeScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasBackupItems = ref.watch(hasBackupItemsProvider);

    return Center(
      child: hasBackupItems ? const _HomeScreenSync() : Text(context.l10n.homeScreenNoBackupItems),
    );
  }
}

class _HomeScreenSync extends ConsumerWidget {
  const _HomeScreenSync({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 120,
      width: 120,
      child: FilledButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.sync),
        label: const Text('Sync'),
      ),
    );
  }
}
