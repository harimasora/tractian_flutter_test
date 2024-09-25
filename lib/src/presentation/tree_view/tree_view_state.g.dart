// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_view_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rootTreeNodeHash() => r'ded749f3159349c92f8c3f6eb76e018bbaebe8b8';

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

/// See also [rootTreeNode].
@ProviderFor(rootTreeNode)
const rootTreeNodeProvider = RootTreeNodeFamily();

/// See also [rootTreeNode].
class RootTreeNodeFamily extends Family<TreeNode> {
  /// See also [rootTreeNode].
  const RootTreeNodeFamily();

  /// See also [rootTreeNode].
  RootTreeNodeProvider call(
    String companyId,
  ) {
    return RootTreeNodeProvider(
      companyId,
    );
  }

  @override
  RootTreeNodeProvider getProviderOverride(
    covariant RootTreeNodeProvider provider,
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
  String? get name => r'rootTreeNodeProvider';
}

/// See also [rootTreeNode].
class RootTreeNodeProvider extends AutoDisposeProvider<TreeNode> {
  /// See also [rootTreeNode].
  RootTreeNodeProvider(
    String companyId,
  ) : this._internal(
          (ref) => rootTreeNode(
            ref as RootTreeNodeRef,
            companyId,
          ),
          from: rootTreeNodeProvider,
          name: r'rootTreeNodeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rootTreeNodeHash,
          dependencies: RootTreeNodeFamily._dependencies,
          allTransitiveDependencies:
              RootTreeNodeFamily._allTransitiveDependencies,
          companyId: companyId,
        );

  RootTreeNodeProvider._internal(
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
    TreeNode Function(RootTreeNodeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RootTreeNodeProvider._internal(
        (ref) => create(ref as RootTreeNodeRef),
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
  AutoDisposeProviderElement<TreeNode> createElement() {
    return _RootTreeNodeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RootTreeNodeProvider && other.companyId == companyId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, companyId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RootTreeNodeRef on AutoDisposeProviderRef<TreeNode> {
  /// The parameter `companyId` of this provider.
  String get companyId;
}

class _RootTreeNodeProviderElement extends AutoDisposeProviderElement<TreeNode>
    with RootTreeNodeRef {
  _RootTreeNodeProviderElement(super.provider);

  @override
  String get companyId => (origin as RootTreeNodeProvider).companyId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
