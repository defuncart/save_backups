import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'backup_items_state.g.dart';

@riverpod
class BackupItems extends _$BackupItems {
  @override
  List<BackupItem> build() => <BackupItem>[];

  void add(BackupItem item) => state = [...state, item];
}

@riverpod
bool hasBackupItems(HasBackupItemsRef ref) => ref.watch(backupItemsProvider).isNotEmpty;
