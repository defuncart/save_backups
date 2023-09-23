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
String _$syncStatusControllerHash() => r'75377444ac6685fa4fd12c2ad29d99483c60e3b5';

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
