import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:game_saves_backup/core/sync/repositories/items_repository.dart';
import 'package:game_saves_backup/core/sync/repositories/uuid_repository.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_items_state.g.dart';

@riverpod
ItemsRepository _itemsRepository(Ref ref) => HiveItemsRepository();

@riverpod
UUIDRepository _uuidRepository(Ref ref) => UUIDRepositoryImpl();

@riverpod
class BackupItems extends _$BackupItems {
  List<BackupItem> _getAllItems() => ref.read(_itemsRepositoryProvider).getAllItems().toList();

  @override
  List<BackupItem> build() => _getAllItems();

  void add({required String path}) {
    final id = ref.read(_uuidRepositoryProvider).generate();
    final folderName = determineFolderNameForPath(path);
    ref.read(_itemsRepositoryProvider).addItem(
          BackupItem(
            id: id,
            path: path,
            folderName: folderName,
          ),
        );
    state = _getAllItems();
  }

  void updateName({
    required BackupItem item,
    required String folderName,
  }) {
    final newItem = item.updateFolderName(folderName);
    ref.read(_itemsRepositoryProvider).addItem(newItem);
    state = _getAllItems();
  }

  void remove(String id) {
    ref.read(_itemsRepositoryProvider).removeItem(id);
    state = _getAllItems();
  }
}

@visibleForTesting
String determineFolderNameForPath(String path) {
  final pathComponents = p.split(path);
  // prefix
  if (pathComponents.indexOf('drive_c') > 0) {
    return pathComponents.sublist(0, pathComponents.indexOf('drive_c')).last;
  }
  // steam save
  else if (pathComponents.contains('userdata')) {
    final index = pathComponents.indexOf('userdata');
    final indexSteamId = index + 2;
    if (index > 0 && indexSteamId < pathComponents.length) {
      return pathComponents[indexSteamId];
    }
  }

  return pathComponents.last;
}

@riverpod
bool hasBackupItems(Ref ref) => ref.watch(backupItemsProvider).isNotEmpty;

extension on BackupItem {
  BackupItem updateFolderName(String folderName) => BackupItem(
        id: id,
        folderName: folderName,
        path: path,
      );
}
