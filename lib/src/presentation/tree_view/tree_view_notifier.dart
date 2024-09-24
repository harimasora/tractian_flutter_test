import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/fake_api.dart';
import 'components/tree_controller.dart';
import 'tree_view_state.dart';

part 'tree_view_notifier.g.dart';

@riverpod
class TreeViewNotifier extends _$TreeViewNotifier {
  @override
  TreeViewState build(String companyId) {
    final response = ref.watch(treeViewProvider(companyId));
    return TreeViewState(response: response);
  }

  void refresh() {
    ref.invalidate(assetsProvider(companyId));
  }

  void setTreeController(TreeController<TreeNode> treeController) {
    state = state.copyWith(
      treeController: treeController,
    );
  }

  Iterable<TreeNode> getChildren(TreeNode node) {
    if (state.treeFilter case TreeSearchResult<TreeNode> filter?) {
      return node.children.where(filter.hasMatch);
    }
    return node.children;
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

@riverpod
TreeController<TreeNode> treeController(TreeControllerRef ref, String companyId) {
  final notifier = ref.watch(TreeViewNotifierProvider(companyId).notifier);
  final root = ref.watch(TreeViewNotifierProvider(companyId).select((v) => v.root));
  return TreeController(roots: root.children, childrenProvider: notifier.getChildren)..expandAll();
}
