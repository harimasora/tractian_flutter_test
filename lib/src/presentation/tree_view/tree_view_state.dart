import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/fake_api.dart';
import '../../models/asset.dart';
import '../../models/location.dart';
import 'components/tree_controller.dart';

part 'tree_view_state.freezed.dart';

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

  TreeNode get root {
    final assets = response.asData?.value.assets ?? [];
    final locations = response.asData?.value.locations ?? [];

    final builder = TreeBuilder(assets: assets, locations: locations);
    final root = builder.buildTree();

    return root;
  }

  List<Asset> get filteredAssets {
    final assets = response.asData?.value.assets ?? [];
    final locations = response.asData?.value.locations ?? [];

    final stuff = [...locations, ...assets];

    final filteredByType = currentFilters.isNotEmpty
        ? stuff
            .where((dynamic v) => v is Asset ? currentFilters.map((e) => e.name).contains(v.sensorType) : false)
            .toList()
        : assets;

    final filteredByText = filteredByType
        .where((dynamic v) =>
            (v is Asset || v is Location) ? v.name.toLowerCase().contains(searchText.toLowerCase()) : false)
        .toList();

    return filteredByText as List<Asset>;
  }
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

    // Create the tree structure
    TreeNode root = TreeNode(id: '/', name: '/'); // Use a dummy root node

    var i = 0;

    // If the item is 100 levels deep, there is probably some error in the data, so we finish the loop.
    while (nodeMap.isNotEmpty && i < 100) {
      for (var node in [...nodeMap.values]) {
        var item = node;
        final alreadyExists = findInTree(root, (node) => [...node.children], (node) => node.id == item.id);
        if (alreadyExists != null) {
          continue;
        }

        if (item.parentId == null) {
          root = root.copyWith(children: [...root.children, node]);
          nodeMap.remove(node.id);
        } else {
          TreeNode? found = findInTree(root, (node) => [...node.children], (node) => node.id == item.parentId);
          if (found != null) {
            root = root.copyWith(children: [...root.children]);
            root = updateNestedChild(found, (v) => v.copyWith(children: [...v.children, node]), root: root);
            nodeMap.remove(node.id);
          }
        }
      }
      i++;
    }

    return root;
  }
}

TreeNode updateNestedChild(TreeNode childToUpdate, TreeNode Function(TreeNode data) transformer, {TreeNode? root}) {
  return (root ?? childToUpdate).copyWith(children: [
    ...(root ?? childToUpdate)
        .children
        .where((child) => child != childToUpdate)
        .map((child) => updateNestedChild(childToUpdate, transformer, root: child))
        .toList(),
    ...(root ?? childToUpdate).children.where((child) => child == childToUpdate).map(transformer).toList()
  ]);
}

N? findInTree<N>(N root, List<N> Function(N node) getChildren, bool Function(N child) childMatches) {
  N? matched;
  traverseTree<N>(root, getChildren, (node) {
    if (childMatches(node)) {
      matched = node;
      return false;
    }
    return true;
  });

  return matched;
}

bool traverseTree<N>(N root, List<N> Function(N node) getChildren, bool Function(N child) processChild) {
  for (final child in getChildren(root)) {
    /// we terminate the traversal if [processChild] returns false.
    if (!processChild(child)) {
      return false;
    }

    if (!traverseTree(child, getChildren, processChild)) {
      return false;
    }
  }
  return true;
}
