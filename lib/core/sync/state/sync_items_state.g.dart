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
String _$backupItemExistsHash() => r'76658db805b09e5c73fdc9301ef4093f1fd1e01d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [backupItemExists].
@ProviderFor(backupItemExists)
const backupItemExistsProvider = BackupItemExistsFamily();

/// See also [backupItemExists].
class BackupItemExistsFamily extends Family<AsyncValue<bool>> {
  /// See also [backupItemExists].
  const BackupItemExistsFamily();

  /// See also [backupItemExists].
  BackupItemExistsProvider call({
    required String path,
  }) {
    return BackupItemExistsProvider(
      path: path,
    );
  }

  @override
  BackupItemExistsProvider getProviderOverride(
    covariant BackupItemExistsProvider provider,
  ) {
    return call(
      path: provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies => _allTransitiveDependencies;

  @override
  String? get name => r'backupItemExistsProvider';
}

/// See also [backupItemExists].
class BackupItemExistsProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [backupItemExists].
  BackupItemExistsProvider({
    required String path,
  }) : this._internal(
          (ref) => backupItemExists(
            ref as BackupItemExistsRef,
            path: path,
          ),
          from: backupItemExistsProvider,
          name: r'backupItemExistsProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$backupItemExistsHash,
          dependencies: BackupItemExistsFamily._dependencies,
          allTransitiveDependencies: BackupItemExistsFamily._allTransitiveDependencies,
          path: path,
        );

  BackupItemExistsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<bool> Function(BackupItemExistsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BackupItemExistsProvider._internal(
        (ref) => create(ref as BackupItemExistsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _BackupItemExistsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BackupItemExistsProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BackupItemExistsRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `path` of this provider.
  String get path;
}

class _BackupItemExistsProviderElement extends AutoDisposeFutureProviderElement<bool> with BackupItemExistsRef {
  _BackupItemExistsProviderElement(super.provider);

  @override
  String get path => (origin as BackupItemExistsProvider).path;
}

String _$syncDirectoryControllerHash() => r'933f5953a47628458c1679b85526638207880733';

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
String _$syncCreateNewFoldersControllerHash() => r'246c74ce729476bf53750725895abc793efdda9c';

/// See also [SyncCreateNewFoldersController].
@ProviderFor(SyncCreateNewFoldersController)
final syncCreateNewFoldersControllerProvider =
    AutoDisposeNotifierProvider<SyncCreateNewFoldersController, bool>.internal(
  SyncCreateNewFoldersController.new,
  name: r'syncCreateNewFoldersControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product') ? null : _$syncCreateNewFoldersControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SyncCreateNewFoldersController = AutoDisposeNotifier<bool>;
String _$syncStatusControllerHash() => r'9d378bd6cf856653cb07d075461cd94c53a58100';

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
