import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/asset.dart';
import '../models/company.dart';
import '../models/location.dart';
import '../providers/dio_provider.dart';

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
