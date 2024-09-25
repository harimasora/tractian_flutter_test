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

  void toggleFilter(ComponentType selectedFilter, TreeController<TreeNode> controller) {
    final newFilters = [...state.currentFilters];
    newFilters.contains(selectedFilter) ? newFilters.remove(selectedFilter) : newFilters.add(selectedFilter);
    state = state.copyWith(
      currentFilters: newFilters,
    );

    _filterTree(controller);
  }

  void setSearchText(String text, TreeController<TreeNode> controller) {
    state = state.copyWith(
      searchText: text,
    );
    _filterTree(controller);
  }

  void _filterTree(TreeController<TreeNode> controller) {
    final filters = state.currentFilters;
    final searchText = state.searchText;

    state = state.copyWith(
      treeFilter: null,
    );

    if (searchText.isEmpty && filters.isEmpty) {
      return;
    }

    final treeFilter = controller.search((node) {
      final toggleCondition = filters.isNotEmpty ? filters.contains(node.componentType) : true;
      final textCondition = searchText.isNotEmpty ? node.name.toLowerCase().contains(searchText.toLowerCase()) : true;
      return toggleCondition && textCondition;
    });

    state = state.copyWith(
      treeFilter: treeFilter,
    );
  }
}

@riverpod
TreeController<TreeNode> treeController(TreeControllerRef ref, String companyId) {
  final notifier = ref.watch(TreeViewNotifierProvider(companyId).notifier);
  final root = ref.watch(TreeViewNotifierProvider(companyId).select((v) => v.root));
  return TreeController(roots: root.children, childrenProvider: notifier.getChildren)..expandAll();
}
