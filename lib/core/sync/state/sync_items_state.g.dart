// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_items_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$syncSettingsRepositoryHash() => r'8f77cb3ac719fde462700c2ad41587dcc63e47ce';

/// See also [_syncSettingsRepository].
@ProviderFor(_syncSettingsRepository)
final _syncSettingsRepositoryProvider = AutoDisposeProvider<SyncSettingsRepository>.internal(
  _syncSettingsRepository,
  name: r'_syncSettingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$syncSettingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _SyncSettingsRepositoryRef = AutoDisposeProviderRef<SyncSettingsRepository>;
String _$filesRepositoryHash() => r'5324da4beee0847fbeb60560d11e8a83092d516d';

/// See also [_filesRepository].
@ProviderFor(_filesRepository)
final _filesRepositoryProvider = AutoDisposeProvider<FilesRepository>.internal(
  _filesRepository,
  name: r'_filesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$filesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _FilesRepositoryRef = AutoDisposeProviderRef<FilesRepository>;
String _$syncDirectoryControllerHash() => r'0531363f09c12c48f50ce60f65e185f756970d14';

/// See also [SyncDirectoryController].
@ProviderFor(SyncDirectoryController)
final syncDirectoryControllerProvider = AutoDisposeAsyncNotifierProvider<SyncDirectoryController, String>.internal(
  SyncDirectoryController.new,
  name: r'syncDirectoryControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$syncDirectoryControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncDirectoryController = AutoDisposeAsyncNotifier<String>;
String _$syncStatusControllerHash() => r'79f9a329f1f1e51c9a98db3f9c6b77f480d82d94';

/// See also [SyncStatusController].
@ProviderFor(SyncStatusController)
final syncStatusControllerProvider = AutoDisposeNotifierProvider<SyncStatusController, SyncStatus>.internal(
  SyncStatusController.new,
  name: r'syncStatusControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$syncStatusControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncStatusController = AutoDisposeNotifier<SyncStatus>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
