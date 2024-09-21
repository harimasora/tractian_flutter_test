import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset.freezed.dart';
part 'asset.g.dart';

@freezed
class Asset with _$Asset {
  const factory Asset({
    required String id,
    required String name,
    String? parentId,
    String? sensorId,
    String? sensorType,
    String? status,
    String? gatewayId,
    String? locationId,
  }) = _Asset;

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
}
