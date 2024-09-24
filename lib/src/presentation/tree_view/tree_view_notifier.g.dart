// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_view_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$treeViewNotifierHash() => r'2cee759dad2e70c4693e88c58ed9365d16274311';

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

abstract class _$TreeViewNotifier
    extends BuildlessAutoDisposeNotifier<TreeViewState> {
  late final String companyId;

  TreeViewState build(
    String companyId,
  );
}

/// See also [TreeViewNotifier].
@ProviderFor(TreeViewNotifier)
const treeViewNotifierProvider = TreeViewNotifierFamily();

/// See also [TreeViewNotifier].
class TreeViewNotifierFamily extends Family<TreeViewState> {
  /// See also [TreeViewNotifier].
  const TreeViewNotifierFamily();

  /// See also [TreeViewNotifier].
  TreeViewNotifierProvider call(
    String companyId,
  ) {
    return TreeViewNotifierProvider(
      companyId,
    );
  }

  @override
  TreeViewNotifierProvider getProviderOverride(
    covariant TreeViewNotifierProvider provider,
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
  String? get name => r'treeViewNotifierProvider';
}

/// See also [TreeViewNotifier].
class TreeViewNotifierProvider
    extends AutoDisposeNotifierProviderImpl<TreeViewNotifier, TreeViewState> {
  /// See also [TreeViewNotifier].
  TreeViewNotifierProvider(
    String companyId,
  ) : this._internal(
          () => TreeViewNotifier()..companyId = companyId,
          from: treeViewNotifierProvider,
          name: r'treeViewNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$treeViewNotifierHash,
          dependencies: TreeViewNotifierFamily._dependencies,
          allTransitiveDependencies:
              TreeViewNotifierFamily._allTransitiveDependencies,
          companyId: companyId,
        );

  TreeViewNotifierProvider._internal(
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
  TreeViewState runNotifierBuild(
    covariant TreeViewNotifier notifier,
  ) {
    return notifier.build(
      companyId,
    );
  }

  @override
  Override overrideWith(TreeViewNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TreeViewNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<TreeViewNotifier, TreeViewState>
      createElement() {
    return _TreeViewNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TreeViewNotifierProvider && other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TreeViewNotifierRef on AutoDisposeNotifierProviderRef<TreeViewState> {
  /// The parameter `companyId` of this provider.
  String get companyId;
}

class _TreeViewNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<TreeViewNotifier, TreeViewState>
    with TreeViewNotifierRef {
  _TreeViewNotifierProviderElement(super.provider);

  @override
  String get companyId => (origin as TreeViewNotifierProvider).companyId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
