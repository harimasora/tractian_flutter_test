import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/fake_api.dart';
import '../../models/asset.dart';
import '../../models/location.dart';
import 'components/tree_controller.dart';

part 'tree_view_state.freezed.dart';

enum AssetType {
  energy,
  vibration,
  ;

  static AssetType? fromString(String? text) {
    return AssetType.values.where((v) => v.name == text).firstOrNull;
  }
}

@freezed
class TreeViewState with _$TreeViewState {
  const factory TreeViewState({
    @Default(AsyncValue<TreeViewResponse>.loading()) AsyncValue<TreeViewResponse> response,
    @Default(false) bool loading,
    @Default('') String searchText,
    @Default([]) List<AssetType> currentFilters,
    TreeController<TreeNode>? treeController,
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

class TreeNode {
  TreeNode({
    required this.id,
    required this.title,
    this.assetType,
    this.parentId,
    Iterable<TreeNode>? children,
  }) : children = <TreeNode>[...?children];

  final String id;
  final String title;
  final AssetType? assetType;
  final String? parentId;
  final List<TreeNode> children;
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
        title: location.name,
        parentId: location.parentId,
      );
    }

    for (final asset in assets) {
      nodeMap[asset.id] = TreeNode(
        id: asset.id,
        title: asset.name,
        assetType: AssetType.fromString(asset.sensorType),
        parentId: asset.parentId,
      );
    }

    // Create the tree structure
    TreeNode root = TreeNode(id: '/', title: '/'); // Use a dummy root node

    var i = 0;

    // If the item is 100 levels deep, there is probably some error in the data, so we finish the loop.
    while (nodeMap.isNotEmpty && i < 100) {
      for (var node in [...nodeMap.values]) {
        var item = node;
        final alreadyExists = findInTree(root, (node) => node.children, (node) => node.id == item.id);
        if (alreadyExists != null) {
          continue;
        }

        if (item.parentId == null) {
          root.children.add(node);
          nodeMap.remove(node.id);
        } else {
          final found = findInTree(root, (node) => node.children, (node) => node.id == item.parentId);
          if (found != null) {
            found.children.add(node);
            nodeMap.remove(node.id);
          }
        }
      }
      i++;
    }

    return root;
  }
}

typedef GetChildren<N> = List<N> Function(N node);
typedef ChildMatches<N> = bool Function(N child);
typedef ProcessChild<N> = bool Function(N child);

/// Searches the tree for a child that satisfies [childMatches]
/// [root] the root of the tree
/// [getChildren] must return the set of children for the current node.
/// [childMatches] is called on each node in the tree. As soon as childMatches
/// returns true then the search is terminated and the current node is returned.
/// ```dart
///   /// search the tree for the 'theOne'.
///   var theOne = findInTree<SMCState>(virtualRoot, (node) => node.children, (node) => node.isTheOne);
/// ```
N? findInTree<N>(N root, GetChildren<N> getChildren, ChildMatches<N> childMatches) {
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

/// Traverses the tree calling [processChild] for every node in the tree.
///
/// Tree treversal will continue until all nodes are visited or [processChild] returns
/// false.
///
/// We return true if the tree was fully traversed.
///
/// ```dart
///   traverseTree<SMCState>(virtualRoot, (node) => node.children, (node) {
///     print(node);
///
///     /// return false if you want to stop traversal
///     return true;
///   });
///
/// ```

bool traverseTree<N>(N root, GetChildren<N> getChildren, ProcessChild<N> processChild) {
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
