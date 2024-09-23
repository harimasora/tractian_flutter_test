// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assets_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$assetsNotifierHash() => r'79d660806c27c2335bb27eefa2f1310d6ff5c694';

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

abstract class _$AssetsNotifier
    extends BuildlessAutoDisposeNotifier<AssetsState> {
  late final String companyId;

  AssetsState build(
    String companyId,
  );
}

/// See also [AssetsNotifier].
@ProviderFor(AssetsNotifier)
const assetsNotifierProvider = AssetsNotifierFamily();

/// See also [AssetsNotifier].
class AssetsNotifierFamily extends Family<AssetsState> {
  /// See also [AssetsNotifier].
  const AssetsNotifierFamily();

  /// See also [AssetsNotifier].
  AssetsNotifierProvider call(
    String companyId,
  ) {
    return AssetsNotifierProvider(
      companyId,
    );
  }

  @override
  AssetsNotifierProvider getProviderOverride(
    covariant AssetsNotifierProvider provider,
  ) {
    return call(
      provider.companyId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'assetsNotifierProvider';
}

/// See also [AssetsNotifier].
class AssetsNotifierProvider
    extends AutoDisposeNotifierProviderImpl<AssetsNotifier, AssetsState> {
  /// See also [AssetsNotifier].
  AssetsNotifierProvider(
    String companyId,
  ) : this._internal(
          () => AssetsNotifier()..companyId = companyId,
          from: assetsNotifierProvider,
          name: r'assetsNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assetsNotifierHash,
          dependencies: AssetsNotifierFamily._dependencies,
          allTransitiveDependencies:
              AssetsNotifierFamily._allTransitiveDependencies,
          companyId: companyId,
        );

  AssetsNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.companyId,
  }) : super.internal();

  final String companyId;

  @override
  AssetsState runNotifierBuild(
    covariant AssetsNotifier notifier,
  ) {
    return notifier.build(
      companyId,
    );
  }

  @override
  Override overrideWith(AssetsNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AssetsNotifierProvider._internal(
        () => create()..companyId = companyId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        companyId: companyId,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<AssetsNotifier, AssetsState>
      createElement() {
    return _AssetsNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssetsNotifierProvider && other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssetsNotifierRef on AutoDisposeNotifierProviderRef<AssetsState> {
  /// The parameter `companyId` of this provider.
  String get companyId;
}

class _AssetsNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<AssetsNotifier, AssetsState>
    with AssetsNotifierRef {
  _AssetsNotifierProviderElement(super.provider);

  @override
  String get companyId => (origin as AssetsNotifierProvider).companyId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
