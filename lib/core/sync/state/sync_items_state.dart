import 'package:game_saves_backup/core/sync/models/sync_progress.dart';
import 'package:game_saves_backup/core/sync/state/backup_items_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_items_state.g.dart';

@riverpod
class SyncDirectoryController extends _$SyncDirectoryController {
  @override
  Future<String> build() async => (await getDownloadsDirectory())!.path;

  Future<void> setPath(String path) async {
    state = AsyncValue.data(path);
  }
}

@riverpod
class SyncStatusController extends _$SyncStatusController {
  @override
  SyncStatus build() => const SyncStatusReady();

  Future<void> sync() async {
    final items = ref.read(backupItemsProvider);
    state = const SyncStatusReady();

    int foldersSynced = 0;
    for (final _ in items) {
      state = SyncStatusProgress(
        count: foldersSynced,
        total: items.length,
      );
      await Future.delayed(const Duration(seconds: 2));
      foldersSynced++;
    }

    state = SyncStatusCompleted(
      itemsSynced: items.length,
    );
  }

  void reset() => state = const SyncStatusReady();
}
