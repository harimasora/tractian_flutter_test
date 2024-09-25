import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/fake_api.dart';
import '../../models/asset.dart';
import '../../models/location.dart';
import 'components/tree_controller.dart';
import 'tree_view_notifier.dart';

part 'tree_view_state.freezed.dart';
part 'tree_view_state.g.dart';

enum NodeType {
  location,
  asset,
  component,
}

enum ComponentType {
  energy,
  vibration,
  ;

  static ComponentType? fromString(String? text) {
    return ComponentType.values.where((v) => v.name == text).firstOrNull;
  }
}

@freezed
class TreeViewState with _$TreeViewState {
  const factory TreeViewState({
    @Default(AsyncValue<TreeViewResponse>.loading()) AsyncValue<TreeViewResponse> response,
    @Default(false) bool loading,
    @Default('') String searchText,
    @Default([]) List<ComponentType> currentFilters,
    TreeController<TreeNode>? treeController,
    TreeSearchResult<TreeNode>? treeFilter,
  }) = _TreeViewState;

  const TreeViewState._();
}

@freezed
class TreeNode with _$TreeNode {
  const factory TreeNode({
    required String id,
    required String name,
    @Default([]) List<TreeNode> children,
    @Default(NodeType.location) NodeType nodeType,
    ComponentType? componentType,
    String? parentId,
  }) = _TreeNode;
}

class TreeBuilder {
  TreeBuilder({required this.locations, required this.assets});
  final List<Location> locations;
  final List<Asset> assets;

  TreeNode buildTree() {
    Map<String, TreeNode> nodeMap = {};

    for (final location in locations) {
      nodeMap[location.id] = TreeNode(
        id: location.id,
        name: location.name,
        parentId: location.parentId,
        nodeType: NodeType.location,
      );
    }

    for (final asset in assets) {
      nodeMap[asset.id] = TreeNode(
        id: asset.id,
        name: asset.name,
        componentType: ComponentType.fromString(asset.sensorType),
        parentId: asset.parentId,
        nodeType: asset.parentId == null ? NodeType.asset : NodeType.component,
      );
    }

    TreeNode root = TreeNode(id: '/', name: '/'); // Use a dummy root node

    for (var item in nodeMap.values) {
      if (item.parentId != null) {
        final parentItem = nodeMap[item.parentId];
        if (parentItem != null) {
          final updatedParent = parentItem.copyWith(
            children: [...parentItem.children, item],
          );
          nodeMap[item.parentId!] = updatedParent;
        }
      } else {
        root = root.copyWith(children: [...root.children, item]);
      }
    }

    return root;
  }
}

@riverpod
TreeNode rootTreeNode(RootTreeNodeRef ref, String companyId) {
  final response = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.response));
  final assets = response.asData?.value.assets ?? [];
  final locations = response.asData?.value.locations ?? [];

  final builder = TreeBuilder(assets: assets, locations: locations);
  final root = builder.buildTree();
  return root;
}
