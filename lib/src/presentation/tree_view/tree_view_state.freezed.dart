// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TreeViewState {
  AsyncValue<TreeViewResponse> get response =>
      throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  List<AssetType> get currentFilters => throw _privateConstructorUsedError;
  TreeController<TreeNode>? get treeController =>
      throw _privateConstructorUsedError;
  TreeSearchResult<TreeNode>? get treeFilter =>
      throw _privateConstructorUsedError;

  /// Create a copy of TreeViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeViewStateCopyWith<TreeViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeViewStateCopyWith<$Res> {
  factory $TreeViewStateCopyWith(
          TreeViewState value, $Res Function(TreeViewState) then) =
      _$TreeViewStateCopyWithImpl<$Res, TreeViewState>;
  @useResult
  $Res call(
      {AsyncValue<TreeViewResponse> response,
      bool loading,
      String searchText,
      List<AssetType> currentFilters,
      TreeController<TreeNode>? treeController,
      TreeSearchResult<TreeNode>? treeFilter});
}

/// @nodoc
class _$TreeViewStateCopyWithImpl<$Res, $Val extends TreeViewState>
    implements $TreeViewStateCopyWith<$Res> {
  _$TreeViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? loading = null,
    Object? searchText = null,
    Object? currentFilters = null,
    Object? treeController = freezed,
    Object? treeFilter = freezed,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TreeViewResponse>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      currentFilters: null == currentFilters
          ? _value.currentFilters
          : currentFilters // ignore: cast_nullable_to_non_nullable
              as List<AssetType>,
      treeController: freezed == treeController
          ? _value.treeController
          : treeController // ignore: cast_nullable_to_non_nullable
              as TreeController<TreeNode>?,
      treeFilter: freezed == treeFilter
          ? _value.treeFilter
          : treeFilter // ignore: cast_nullable_to_non_nullable
              as TreeSearchResult<TreeNode>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeViewStateImplCopyWith<$Res>
    implements $TreeViewStateCopyWith<$Res> {
  factory _$$TreeViewStateImplCopyWith(
          _$TreeViewStateImpl value, $Res Function(_$TreeViewStateImpl) then) =
      __$$TreeViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<TreeViewResponse> response,
      bool loading,
      String searchText,
      List<AssetType> currentFilters,
      TreeController<TreeNode>? treeController,
      TreeSearchResult<TreeNode>? treeFilter});
}

/// @nodoc
class __$$TreeViewStateImplCopyWithImpl<$Res>
    extends _$TreeViewStateCopyWithImpl<$Res, _$TreeViewStateImpl>
    implements _$$TreeViewStateImplCopyWith<$Res> {
  __$$TreeViewStateImplCopyWithImpl(
      _$TreeViewStateImpl _value, $Res Function(_$TreeViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? loading = null,
    Object? searchText = null,
    Object? currentFilters = null,
    Object? treeController = freezed,
    Object? treeFilter = freezed,
  }) {
    return _then(_$TreeViewStateImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AsyncValue<TreeViewResponse>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchText: null == searchText
          ? _value.searchText
          : searchText // ignore: cast_nullable_to_non_nullable
              as String,
      currentFilters: null == currentFilters
          ? _value._currentFilters
          : currentFilters // ignore: cast_nullable_to_non_nullable
              as List<AssetType>,
      treeController: freezed == treeController
          ? _value.treeController
          : treeController // ignore: cast_nullable_to_non_nullable
              as TreeController<TreeNode>?,
      treeFilter: freezed == treeFilter
          ? _value.treeFilter
          : treeFilter // ignore: cast_nullable_to_non_nullable
              as TreeSearchResult<TreeNode>?,
    ));
  }
}

/// @nodoc

class _$TreeViewStateImpl extends _TreeViewState {
  const _$TreeViewStateImpl(
      {this.response = const AsyncValue<TreeViewResponse>.loading(),
      this.loading = false,
      this.searchText = '',
      final List<AssetType> currentFilters = const [],
      this.treeController,
      this.treeFilter})
      : _currentFilters = currentFilters,
        super._();

  @override
  @JsonKey()
  final AsyncValue<TreeViewResponse> response;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final String searchText;
  final List<AssetType> _currentFilters;
  @override
  @JsonKey()
  List<AssetType> get currentFilters {
    if (_currentFilters is EqualUnmodifiableListView) return _currentFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentFilters);
  }

  @override
  final TreeController<TreeNode>? treeController;
  @override
  final TreeSearchResult<TreeNode>? treeFilter;

  @override
  String toString() {
    return 'TreeViewState(response: $response, loading: $loading, searchText: $searchText, currentFilters: $currentFilters, treeController: $treeController, treeFilter: $treeFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeViewStateImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.searchText, searchText) ||
                other.searchText == searchText) &&
            const DeepCollectionEquality()
                .equals(other._currentFilters, _currentFilters) &&
            (identical(other.treeController, treeController) ||
                other.treeController == treeController) &&
            (identical(other.treeFilter, treeFilter) ||
                other.treeFilter == treeFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      response,
      loading,
      searchText,
      const DeepCollectionEquality().hash(_currentFilters),
      treeController,
      treeFilter);

  /// Create a copy of TreeViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeViewStateImplCopyWith<_$TreeViewStateImpl> get copyWith =>
      __$$TreeViewStateImplCopyWithImpl<_$TreeViewStateImpl>(this, _$identity);
}

abstract class _TreeViewState extends TreeViewState {
  const factory _TreeViewState(
      {final AsyncValue<TreeViewResponse> response,
      final bool loading,
      final String searchText,
      final List<AssetType> currentFilters,
      final TreeController<TreeNode>? treeController,
      final TreeSearchResult<TreeNode>? treeFilter}) = _$TreeViewStateImpl;
  const _TreeViewState._() : super._();

  @override
  AsyncValue<TreeViewResponse> get response;
  @override
  bool get loading;
  @override
  String get searchText;
  @override
  List<AssetType> get currentFilters;
  @override
  TreeController<TreeNode>? get treeController;
  @override
  TreeSearchResult<TreeNode>? get treeFilter;

  /// Create a copy of TreeViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeViewStateImplCopyWith<_$TreeViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TreeNode {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<TreeNode> get children => throw _privateConstructorUsedError;
  AssetType? get assetType => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeNodeCopyWith<TreeNode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeNodeCopyWith<$Res> {
  factory $TreeNodeCopyWith(TreeNode value, $Res Function(TreeNode) then) =
      _$TreeNodeCopyWithImpl<$Res, TreeNode>;
  @useResult
  $Res call(
      {String id,
      String name,
      List<TreeNode> children,
      AssetType? assetType,
      String? parentId});
}

/// @nodoc
class _$TreeNodeCopyWithImpl<$Res, $Val extends TreeNode>
    implements $TreeNodeCopyWith<$Res> {
  _$TreeNodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? children = null,
    Object? assetType = freezed,
    Object? parentId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNode>,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeNodeImplCopyWith<$Res>
    implements $TreeNodeCopyWith<$Res> {
  factory _$$TreeNodeImplCopyWith(
          _$TreeNodeImpl value, $Res Function(_$TreeNodeImpl) then) =
      __$$TreeNodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      List<TreeNode> children,
      AssetType? assetType,
      String? parentId});
}

/// @nodoc
class __$$TreeNodeImplCopyWithImpl<$Res>
    extends _$TreeNodeCopyWithImpl<$Res, _$TreeNodeImpl>
    implements _$$TreeNodeImplCopyWith<$Res> {
  __$$TreeNodeImplCopyWithImpl(
      _$TreeNodeImpl _value, $Res Function(_$TreeNodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? children = null,
    Object? assetType = freezed,
    Object? parentId = freezed,
  }) {
    return _then(_$TreeNodeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<TreeNode>,
      assetType: freezed == assetType
          ? _value.assetType
          : assetType // ignore: cast_nullable_to_non_nullable
              as AssetType?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TreeNodeImpl implements _TreeNode {
  const _$TreeNodeImpl(
      {required this.id,
      required this.name,
      final List<TreeNode> children = const [],
      this.assetType,
      this.parentId})
      : _children = children;

  @override
  final String id;
  @override
  final String name;
  final List<TreeNode> _children;
  @override
  @JsonKey()
  List<TreeNode> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  final AssetType? assetType;
  @override
  final String? parentId;

  @override
  String toString() {
    return 'TreeNode(id: $id, name: $name, children: $children, assetType: $assetType, parentId: $parentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeNodeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._children, _children) &&
            (identical(other.assetType, assetType) ||
                other.assetType == assetType) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_children), assetType, parentId);

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      __$$TreeNodeImplCopyWithImpl<_$TreeNodeImpl>(this, _$identity);
}

abstract class _TreeNode implements TreeNode {
  const factory _TreeNode(
      {required final String id,
      required final String name,
      final List<TreeNode> children,
      final AssetType? assetType,
      final String? parentId}) = _$TreeNodeImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  List<TreeNode> get children;
  @override
  AssetType? get assetType;
  @override
  String? get parentId;

  /// Create a copy of TreeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeNodeImplCopyWith<_$TreeNodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
