import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:game_saves_backup/core/sync/repositories/items_repository.dart';
import 'package:game_saves_backup/core/sync/repositories/uuid_repository.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_items_state.g.dart';

@riverpod
ItemsRepository _itemsRepository(_ItemsRepositoryRef ref) => HiveItemsRepository();

@riverpod
UUIDRepository _uuidRepository(_UuidRepositoryRef ref) => UUIDRepositoryImpl();

@riverpod
class BackupItems extends _$BackupItems {
  List<BackupItem> _getAllItems() => ref.read(_itemsRepositoryProvider).getAllItems().toList();

  @override
  List<BackupItem> build() => _getAllItems();

  void add({required String path}) {
    final id = ref.read(_uuidRepositoryProvider).generate();
    final pathComponents = p.split(path);
    final folderName = pathComponents.indexOf('drive_c') > 0
        ? pathComponents.sublist(0, pathComponents.indexOf('drive_c')).last
        : pathComponents.last;
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

@riverpod
bool hasBackupItems(HasBackupItemsRef ref) => ref.watch(backupItemsProvider).isNotEmpty;

extension on BackupItem {
  BackupItem updateFolderName(String folderName) => BackupItem(
        id: id,
        folderName: folderName,
        path: path,
      );
}
