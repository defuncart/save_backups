import 'package:game_saves_backup/core/sync/models/backup_item.dart';
import 'package:hive/hive.dart';

abstract class ItemsRepository {
  Iterable<BackupItem> getAllItems();
  void addItem(BackupItem item);
  void removeItem(String id);
}

class HiveItemsRepository extends ItemsRepository {
  late final Box<BackupItem> _box;
  static const _name = 'items';

  HiveItemsRepository() {
    Hive.registerAdapter<BackupItem>(
      'BackupItem',
      (json) => BackupItem.fromJson(json),
    );
    _box = Hive.box<BackupItem>(name: _name);
  }

  @override
  Iterable<BackupItem> getAllItems() => _box.getAll(_box.keys).whereType<BackupItem>();

  @override
  void addItem(BackupItem item) => _box.put(item.id, item);

  @override
  void removeItem(String id) => _box.delete(id);
}
