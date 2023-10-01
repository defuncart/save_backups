import 'package:hive/hive.dart';

abstract class SyncSettingsRepository {
  String? get syncDirectory;
  set syncDirectory(String? value);
  bool get syncToNewFolder;
  set syncToNewFolder(bool value);
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

  @override
  bool get syncToNewFolder => _box.get(
        _Keys.syncToNewFolder,
        defaultValue: _Defaults.syncToNewFolder,
      );

  @override
  set syncToNewFolder(bool value) => _box.put(_Keys.syncToNewFolder, value);
}

class _Keys {
  _Keys._();

  static const syncDirectory = 'syncDirectory';
  static const syncToNewFolder = 'syncToNewFolder';
}

class _Defaults {
  _Defaults._();

  static const syncToNewFolder = true;
}
