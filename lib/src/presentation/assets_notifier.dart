import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/fake_api.dart';
import 'assets_state.dart';

part 'assets_notifier.g.dart';

@riverpod
class AssetsNotifier extends _$AssetsNotifier {
  @override
  AssetsState build(String companyId) {
    final response = ref.watch(assetsProvider(companyId));
    return AssetsState(response: response);
  }

  void refresh() {
    ref.invalidate(assetsProvider(companyId));
  }

  void toggleFilter(AssetType selectedFilter) {
    final newFilters = [...state.currentFilters];
    newFilters.contains(selectedFilter) ? newFilters.remove(selectedFilter) : newFilters.add(selectedFilter);
    state = state.copyWith(
      currentFilters: newFilters,
    );
  }

  setSearchText(String text) {
    state = state.copyWith(
      searchText: text,
    );
  }
}
