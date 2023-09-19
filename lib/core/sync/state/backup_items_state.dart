import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_items_state.g.dart';

@riverpod
class BackupItems extends _$BackupItems {
  @override
  List<BackupItem> build() => <BackupItem>[];

  void add(BackupItem item) => state = [...state, item];

  void remove(BackupItem item) {
    final oldState = state;
    oldState.remove(item);
    state = [...oldState];
  }
}

@riverpod
bool hasBackupItems(HasBackupItemsRef ref) => ref.watch(backupItemsProvider).isNotEmpty;
