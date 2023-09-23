import 'package:game_saves_backup/core/sync/models/sync_progress.dart';
import 'package:game_saves_backup/core/sync/repositories/files_repository.dart';
import 'package:game_saves_backup/core/sync/repositories/settings_repository.dart';
import 'package:game_saves_backup/core/sync/state/backup_items_state.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_items_state.g.dart';

@riverpod
SyncSettingsRepository _syncSettingsRepository(_SyncSettingsRepositoryRef ref) => HiveSyncSettingsRepository();

@riverpod
FilesRepository _filesRepository(_FilesRepositoryRef ref) => FilesRepository();

@riverpod
class SyncDirectoryController extends _$SyncDirectoryController {
  @override
  Future<String> build() async =>
      ref.read(_syncSettingsRepositoryProvider).syncDirectory ?? (await getDownloadsDirectory())!.path;

  Future<void> setPath(String path) async {
    ref.read(_syncSettingsRepositoryProvider).syncDirectory = path;
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

    final syncDirectory = await ref.read(syncDirectoryControllerProvider.future);
    final syncPath = p.join(syncDirectory, 'GameSavesBackup');

    int foldersSynced = 0;
    for (final item in items) {
      state = SyncStatusProgress(
        count: foldersSynced,
        total: items.length,
      );
      final to = p.join(syncPath, item.folderName);
      await ref.read(_filesRepositoryProvider).sync(item.path, to);

      foldersSynced++;
    }

    state = SyncStatusCompleted(
      itemsSynced: items.length,
    );
  }

  void reset() => state = const SyncStatusReady();
}
