// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assets_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssetsState {
  AsyncValue<List<Asset>> get response => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get searchText => throw _privateConstructorUsedError;
  List<AssetType> get currentFilters => throw _privateConstructorUsedError;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetsStateCopyWith<AssetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetsStateCopyWith<$Res> {
  factory $AssetsStateCopyWith(
          AssetsState value, $Res Function(AssetsState) then) =
      _$AssetsStateCopyWithImpl<$Res, AssetsState>;
  @useResult
  $Res call(
      {AsyncValue<List<Asset>> response,
      bool loading,
      String searchText,
      List<AssetType> currentFilters});
}

/// @nodoc
class _$AssetsStateCopyWithImpl<$Res, $Val extends AssetsState>
    implements $AssetsStateCopyWith<$Res> {
  _$AssetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetsState
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
abstract class _$$AssetsStateImplCopyWith<$Res>
    implements $AssetsStateCopyWith<$Res> {
  factory _$$AssetsStateImplCopyWith(
          _$AssetsStateImpl value, $Res Function(_$AssetsStateImpl) then) =
      __$$AssetsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<Asset>> response,
      bool loading,
      String searchText,
      List<AssetType> currentFilters});
}

/// @nodoc
class __$$AssetsStateImplCopyWithImpl<$Res>
    extends _$AssetsStateCopyWithImpl<$Res, _$AssetsStateImpl>
    implements _$$AssetsStateImplCopyWith<$Res> {
  __$$AssetsStateImplCopyWithImpl(
      _$AssetsStateImpl _value, $Res Function(_$AssetsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
    Object? loading = null,
    Object? searchText = null,
    Object? currentFilters = null,
  }) {
    return _then(_$AssetsStateImpl(
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

class _$AssetsStateImpl extends _AssetsState {
  const _$AssetsStateImpl(
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
    return 'AssetsState(response: $response, loading: $loading, searchText: $searchText, currentFilters: $currentFilters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetsStateImpl &&
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

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetsStateImplCopyWith<_$AssetsStateImpl> get copyWith =>
      __$$AssetsStateImplCopyWithImpl<_$AssetsStateImpl>(this, _$identity);
}

abstract class _AssetsState extends AssetsState {
  const factory _AssetsState(
      {final AsyncValue<List<Asset>> response,
      final bool loading,
      final String searchText,
      final List<AssetType> currentFilters}) = _$AssetsStateImpl;
  const _AssetsState._() : super._();

  @override
  AsyncValue<List<Asset>> get response;
  @override
  bool get loading;
  @override
  String get searchText;
  @override
  List<AssetType> get currentFilters;

  /// Create a copy of AssetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetsStateImplCopyWith<_$AssetsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
