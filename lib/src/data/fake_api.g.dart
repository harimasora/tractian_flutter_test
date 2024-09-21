// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companiesHash() => r'8b43ee970683f60964bae8dbe8c638bc937fa150';

/// See also [companies].
@ProviderFor(companies)
final companiesProvider = AutoDisposeFutureProvider<List<Company>>.internal(
  companies,
  name: r'companiesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$companiesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CompaniesRef = AutoDisposeFutureProviderRef<List<Company>>;
String _$locationsHash() => r'cad814c46c84f1bf75c3cc09c02e8691e7a35837';

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

/// See also [locations].
@ProviderFor(locations)
const locationsProvider = LocationsFamily();

/// See also [locations].
class LocationsFamily extends Family<AsyncValue<List<Location>>> {
  /// See also [locations].
  const LocationsFamily();

  /// See also [locations].
  LocationsProvider call(
    String companyId,
  ) {
    return LocationsProvider(
      companyId,
    );
  }

  @override
  LocationsProvider getProviderOverride(
    covariant LocationsProvider provider,
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
  String? get name => r'locationsProvider';
}

/// See also [locations].
class LocationsProvider extends AutoDisposeFutureProvider<List<Location>> {
  /// See also [locations].
  LocationsProvider(
    String companyId,
  ) : this._internal(
          (ref) => locations(
            ref as LocationsRef,
            companyId,
          ),
          from: locationsProvider,
          name: r'locationsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$locationsHash,
          dependencies: LocationsFamily._dependencies,
          allTransitiveDependencies: LocationsFamily._allTransitiveDependencies,
          companyId: companyId,
        );

  LocationsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Location>> Function(LocationsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LocationsProvider._internal(
        (ref) => create(ref as LocationsRef),
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
  AutoDisposeFutureProviderElement<List<Location>> createElement() {
    return _LocationsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LocationsProvider && other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LocationsRef on AutoDisposeFutureProviderRef<List<Location>> {
  /// The parameter `companyId` of this provider.
  String get companyId;
}

class _LocationsProviderElement
    extends AutoDisposeFutureProviderElement<List<Location>> with LocationsRef {
  _LocationsProviderElement(super.provider);

  @override
  String get companyId => (origin as LocationsProvider).companyId;
}

String _$assetsHash() => r'e55de3cae2bdda45d70d1c20c5b0f16e56f6e10c';

/// See also [assets].
@ProviderFor(assets)
const assetsProvider = AssetsFamily();

/// See also [assets].
class AssetsFamily extends Family<AsyncValue<List<Asset>>> {
  /// See also [assets].
  const AssetsFamily();

  /// See also [assets].
  AssetsProvider call(
    String companyId,
  ) {
    return AssetsProvider(
      companyId,
    );
  }

  @override
  AssetsProvider getProviderOverride(
    covariant AssetsProvider provider,
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
  String? get name => r'assetsProvider';
}

/// See also [assets].
class AssetsProvider extends AutoDisposeFutureProvider<List<Asset>> {
  /// See also [assets].
  AssetsProvider(
    String companyId,
  ) : this._internal(
          (ref) => assets(
            ref as AssetsRef,
            companyId,
          ),
          from: assetsProvider,
          name: r'assetsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$assetsHash,
          dependencies: AssetsFamily._dependencies,
          allTransitiveDependencies: AssetsFamily._allTransitiveDependencies,
          companyId: companyId,
        );

  AssetsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<Asset>> Function(AssetsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AssetsProvider._internal(
        (ref) => create(ref as AssetsRef),
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
  AutoDisposeFutureProviderElement<List<Asset>> createElement() {
    return _AssetsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AssetsProvider && other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AssetsRef on AutoDisposeFutureProviderRef<List<Asset>> {
  /// The parameter `companyId` of this provider.
  String get companyId;
}

class _AssetsProviderElement
    extends AutoDisposeFutureProviderElement<List<Asset>> with AssetsRef {
  _AssetsProviderElement(super.provider);

  @override
  String get companyId => (origin as AssetsProvider).companyId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
