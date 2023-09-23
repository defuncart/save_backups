import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:game_saves_backup/core/sync/repositories/uuid_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_items_state.g.dart';

@riverpod
UUIDRepository _uuidRepository(_UuidRepositoryRef ref) => UUIDRepositoryImpl();

@riverpod
class BackupItems extends _$BackupItems {
  @override
  List<BackupItem> build() => <BackupItem>[];

  void add({required String path}) {
    final id = ref.read(_uuidRepositoryProvider).generate();
    final folderName = path.split('/').last;
    final item = BackupItem(
      id: id,
      path: path,
      folderName: folderName,
    );
    state = [...state, item];
  }

  void updateName({
    required BackupItem item,
    required String folderName,
  }) {
    final index = state.indexOf(item);
    if (index != -1) {
      final oldState = state;
      final newItem = item.updateFolderName(folderName);
      oldState[index] = newItem;
      state = [...oldState];
    }
  }

  void remove(BackupItem item) {
    final oldState = state;
    oldState.remove(item);
    state = [...oldState];
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
