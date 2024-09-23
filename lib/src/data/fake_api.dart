import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/asset.dart';
import '../models/company.dart';
import '../models/location.dart';
import '../providers/dio_provider.dart';

part 'fake_api.freezed.dart';
part 'fake_api.g.dart';

@riverpod
FutureOr<List<Company>> companies(CompaniesRef ref) async {
  final client = ref.watch(dioProvider);
  final response = await client.get('companies');
  return [for (final map in response.data) Company.fromJson(map)];
}

@riverpod
FutureOr<List<Location>> locations(LocationsRef ref, String companyId) async {
  final client = ref.watch(dioProvider);
  final response = await client.get('companies/$companyId/locations');
  return [for (final map in response.data) Location.fromJson(map)];
}

@riverpod
FutureOr<List<Asset>> assets(AssetsRef ref, String companyId) async {
  final client = ref.watch(dioProvider);
  final response = await client.get('companies/$companyId/assets');
  return [for (final map in response.data) Asset.fromJson(map)];
}

@riverpod
FutureOr<TreeViewResponse> treeView(TreeViewRef ref, String companyId) async {
  final locations = await ref.watch(locationsProvider(companyId).future);
  final assets = await ref.watch(assetsProvider(companyId).future);
  return TreeViewResponse(
    locations: locations,
    assets: assets,
  );
}

@freezed
class TreeViewResponse with _$TreeViewResponse {
  const factory TreeViewResponse({
    required List<Location> locations,
    required List<Asset> assets,
  }) = _TreeViewResponse;

  factory TreeViewResponse.fromJson(Map<String, dynamic> json) => _$TreeViewResponseFromJson(json);
}
