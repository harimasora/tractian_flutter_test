import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/asset.dart';

part 'tree_view_state.freezed.dart';

enum AssetType {
  energy,
  vibration,
}

@freezed
class TreeViewState with _$TreeViewState {
  const factory TreeViewState({
    @Default(AsyncValue<List<Asset>>.loading()) AsyncValue<List<Asset>> response,
    @Default(false) bool loading,
    @Default('') String searchText,
    @Default([]) List<AssetType> currentFilters,
  }) = _TreeViewState;

  const TreeViewState._();

  List<Asset> get filteredAssets {
    final assets = response.asData?.value ?? [];

    final filteredByType = currentFilters.isNotEmpty
        ? assets.where((asset) => currentFilters.map((e) => e.name).contains(asset.sensorType)).toList()
        : assets;

    final filteredByText =
        filteredByType.where((asset) => asset.name.toLowerCase().contains(searchText.toLowerCase())).toList();

    return filteredByText;
  }
}
