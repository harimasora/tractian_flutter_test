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
  AsyncValue<List<Asset>> get response => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  List<AssetType> get currentFilters => throw _privateConstructorUsedError;

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
      {AsyncValue<List<Asset>> response,
      bool loading,
      String searchText,
      List<AssetType> currentFilters});
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
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Asset>>,
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
      {AsyncValue<List<Asset>> response,
      bool loading,
      String searchText,
      List<AssetType> currentFilters});
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
  }) {
    return _then(_$TreeViewStateImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<Asset>>,
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
    ));
  }
}

/// @nodoc

class _$TreeViewStateImpl extends _TreeViewState {
  const _$TreeViewStateImpl(
      {this.response = const AsyncValue<List<Asset>>.loading(),
      this.loading = false,
      this.searchText = '',
      final List<AssetType> currentFilters = const []})
      : _currentFilters = currentFilters,
        super._();

  @override
  @JsonKey()
  final AsyncValue<List<Asset>> response;
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
  String toString() {
    return 'TreeViewState(response: $response, loading: $loading, searchText: $searchText, currentFilters: $currentFilters)';
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
                .equals(other._currentFilters, _currentFilters));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response, loading, searchText,
      const DeepCollectionEquality().hash(_currentFilters));

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
      {final AsyncValue<List<Asset>> response,
      final bool loading,
      final String searchText,
      final List<AssetType> currentFilters}) = _$TreeViewStateImpl;
  const _TreeViewState._() : super._();

  @override
  AsyncValue<List<Asset>> get response;
  @override
  bool get loading;
  @override
  String get searchText;
  @override
  List<AssetType> get currentFilters;

  /// Create a copy of TreeViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeViewStateImplCopyWith<_$TreeViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
