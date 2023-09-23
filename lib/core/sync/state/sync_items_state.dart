// import 'package:game_saves_backup/core/sync/models/backup_item.dart';
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
class SyncController extends _$SyncController {
  @override
  SyncProgress build() => const SyncProgress(
        status: SyncStatus.ready,
        progress: 0,
      );

  Future<void> sync() async {
    final items = ref.read(backupItemsProvider);
    state = const SyncProgress(
      status: SyncStatus.inProgress,
      progress: 0,
    );

    int foldersSynced = 0;
    for (final _ in items) {
      await Future.delayed(const Duration(seconds: 2));
      foldersSynced++;
      state = SyncProgress(
        status: SyncStatus.inProgress,
        progress: foldersSynced / items.length,
      );
    }

    state = const SyncProgress(
      status: SyncStatus.complete,
      progress: 1,
    );
  }
}
