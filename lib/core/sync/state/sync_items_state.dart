import 'dart:developer' show log;

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
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
  Future<String> build() async => ref.read(_syncSettingsRepositoryProvider).syncDirectory ?? await _defaultDirectory;

  Future<String> get _defaultDirectory => switch (defaultTargetPlatform) {
        TargetPlatform.linux => getDownloadsDirectory().then((value) => value!.path),
        _ => getApplicationSupportDirectory().then((value) => value.path),
      };

  Future<void> setPath(String path) async {
    ref.read(_syncSettingsRepositoryProvider).syncDirectory = path;
    state = AsyncValue.data(path);
  }
}

@riverpod
class SyncCreateNewFoldersController extends _$SyncCreateNewFoldersController {
  @override
  bool build() => ref.read(_syncSettingsRepositoryProvider).syncToNewFolder;

  void toggle() {
    final newValue = !state;
    ref.read(_syncSettingsRepositoryProvider).syncToNewFolder = newValue;
    state = newValue;
  }
}

@riverpod
class SyncStatusController extends _$SyncStatusController {
  @override
  SyncStatus build() => const SyncStatusReady();

  Future<void> sync() async {
    log('Starting sync');
    final items = ref.read(backupItemsProvider);
    state = const SyncStatusReady();

    final syncDirectory = await ref.read(syncDirectoryControllerProvider.future);
    var syncPath = p.join(syncDirectory, 'GameSavesBackup');
    if (ref.read(syncCreateNewFoldersControllerProvider)) {
      final timestamp = clock.now().toUtc().toString().replaceAll(':', '-');
      syncPath = p.join(syncPath, timestamp);
    }

    int foldersSynced = 0;
    for (final item in items) {
      state = SyncStatusProgress(
        count: foldersSynced,
        total: items.length,
      );
      final from = item.path;
      final to = p.join(syncPath, item.folderName);
      log('Syncing $foldersSynced/${items.length}: $from to $to');
      await ref.read(_filesRepositoryProvider).sync(from, to);

      foldersSynced++;
    }

    state = SyncStatusCompleted(
      itemsSynced: items.length,
    );
    log('Sync completed');
  }

  void reset() => state = const SyncStatusReady();
}
