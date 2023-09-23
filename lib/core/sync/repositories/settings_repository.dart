import 'package:hive/hive.dart';

abstract class SyncSettingsRepository {
  String? get syncDirectory;
  set syncDirectory(String? value);
}

class HiveSyncSettingsRepository extends SyncSettingsRepository {
  late final Box<dynamic> _box;
  static const _name = 'sync_settings';

  HiveSyncSettingsRepository() {
    _box = Hive.box<dynamic>(name: _name);
  }

  @override
  String? get syncDirectory => _box.get(_Keys.syncDirectory) as String?;

  @override
  set syncDirectory(String? value) => _box.put(_Keys.syncDirectory, value);
}

class _Keys {
  _Keys._();

  static const syncDirectory = 'syncDirectory';
}
