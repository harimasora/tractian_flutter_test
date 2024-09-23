// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fake_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TreeViewResponse _$TreeViewResponseFromJson(Map<String, dynamic> json) {
  return _TreeViewResponse.fromJson(json);
}

/// @nodoc
mixin _$TreeViewResponse {
  List<Location> get locations => throw _privateConstructorUsedError;
  List<Asset> get assets => throw _privateConstructorUsedError;

  /// Serializes this TreeViewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TreeViewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TreeViewResponseCopyWith<TreeViewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeViewResponseCopyWith<$Res> {
  factory $TreeViewResponseCopyWith(
          TreeViewResponse value, $Res Function(TreeViewResponse) then) =
      _$TreeViewResponseCopyWithImpl<$Res, TreeViewResponse>;
  @useResult
  $Res call({List<Location> locations, List<Asset> assets});
}

/// @nodoc
class _$TreeViewResponseCopyWithImpl<$Res, $Val extends TreeViewResponse>
    implements $TreeViewResponseCopyWith<$Res> {
  _$TreeViewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TreeViewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TreeViewResponseImplCopyWith<$Res>
    implements $TreeViewResponseCopyWith<$Res> {
  factory _$$TreeViewResponseImplCopyWith(_$TreeViewResponseImpl value,
          $Res Function(_$TreeViewResponseImpl) then) =
      __$$TreeViewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Location> locations, List<Asset> assets});
}

/// @nodoc
class __$$TreeViewResponseImplCopyWithImpl<$Res>
    extends _$TreeViewResponseCopyWithImpl<$Res, _$TreeViewResponseImpl>
    implements _$$TreeViewResponseImplCopyWith<$Res> {
  __$$TreeViewResponseImplCopyWithImpl(_$TreeViewResponseImpl _value,
      $Res Function(_$TreeViewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of TreeViewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
    Object? assets = null,
  }) {
    return _then(_$TreeViewResponseImpl(
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<Location>,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TreeViewResponseImpl implements _TreeViewResponse {
  const _$TreeViewResponseImpl(
      {required final List<Location> locations,
      required final List<Asset> assets})
      : _locations = locations,
        _assets = assets;

  factory _$TreeViewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$TreeViewResponseImplFromJson(json);

  final List<Location> _locations;
  @override
  List<Location> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'TreeViewResponse(locations: $locations, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TreeViewResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_locations),
      const DeepCollectionEquality().hash(_assets));

  /// Create a copy of TreeViewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TreeViewResponseImplCopyWith<_$TreeViewResponseImpl> get copyWith =>
      __$$TreeViewResponseImplCopyWithImpl<_$TreeViewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TreeViewResponseImplToJson(
      this,
    );
  }
}

abstract class _TreeViewResponse implements TreeViewResponse {
  const factory _TreeViewResponse(
      {required final List<Location> locations,
      required final List<Asset> assets}) = _$TreeViewResponseImpl;

  factory _TreeViewResponse.fromJson(Map<String, dynamic> json) =
      _$TreeViewResponseImpl.fromJson;

  @override
  List<Location> get locations;
  @override
  List<Asset> get assets;

  /// Create a copy of TreeViewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TreeViewResponseImplCopyWith<_$TreeViewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
