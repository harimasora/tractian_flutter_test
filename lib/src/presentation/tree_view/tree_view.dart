import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/sliver_tree.dart';
import 'components/tree_controller.dart';
import 'components/tree_indentation.dart';
import 'components/tree_view.dart';
import 'tree_view_notifier.dart';
import 'tree_view_state.dart';

class AssetsPage extends HookConsumerWidget {
  const AssetsPage({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(treeViewNotifierProvider(companyId).notifier);
    final response = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.response));
    final currentFilters = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.currentFilters));
    final treeController = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.treeController));
    final root = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.root));

    TreeSearchResult<TreeNode>? filter;
    Pattern? searchPattern;

    Iterable<TreeNode> getChildren(TreeNode node) {
      if (filter case TreeSearchResult<TreeNode> filter?) {
        return node.children.where(filter.hasMatch);
      }
      return node.children;
    }

    useEffect(() {
      if (root.children.isNotEmpty) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final treeController = TreeController(roots: root.children, childrenProvider: getChildren)..expandAll();
          notifier.setTreeController(treeController);
        });
      }
      return treeController?.dispose;
    }, [root]);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tractian'),
        backgroundColor: Colors.blueAccent,
      ),
      body: response.when(
        data: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: notifier.setSearchText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Buscar Ativo ou Local',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      ActionChip(
                        label: Text(
                          'Sensor de energia',
                          style: TextStyle(
                            color: currentFilters.contains(AssetType.energy) ? Colors.white : Colors.black,
                          ),
                        ),
                        avatar: Icon(
                          Icons.bolt,
                          color: currentFilters.contains(AssetType.energy) ? Colors.white : Colors.black,
                        ),
                        onPressed: () => notifier.toggleFilter(AssetType.energy),
                        backgroundColor: currentFilters.contains(AssetType.energy) ? Colors.blue : Colors.transparent,
                      ),
                      ActionChip(
                        label: Text(
                          'Crítico',
                          style: TextStyle(
                            color: currentFilters.contains(AssetType.vibration) ? Colors.white : Colors.black,
                          ),
                        ),
                        avatar: Icon(
                          Icons.warning_amber,
                          color: currentFilters.contains(AssetType.vibration) ? Colors.white : Colors.black,
                        ),
                        onPressed: () => notifier.toggleFilter(AssetType.vibration),
                        backgroundColor:
                            currentFilters.contains(AssetType.vibration) ? Colors.blue : Colors.transparent,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: treeController != null
                  ? AnimatedTreeView<TreeNode>(
                      treeController: treeController,
                      nodeBuilder: (BuildContext context, TreeEntry<TreeNode> entry) {
                        return TreeTile(
                          entry: entry,
                          match: filter?.matchOf(entry.node),
                          searchPattern: searchPattern,
                        );
                      },
                    )
                  : Text('No content'),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: items.length,
            //     itemBuilder: (context, index) => ListTile(
            //       title: Text(items[index].name),
            //       subtitle: Text(items[index].sensorType.toString()),
            //       onTap: () {
            //         print(items[index].toString());
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Text('Loading...'),
      ),
    );
  }
}

class TreeTile extends StatefulWidget {
  const TreeTile({
    super.key,
    required this.entry,
    required this.match,
    required this.searchPattern,
  });

  final TreeEntry<TreeNode> entry;
  final TreeSearchMatch? match;
  final Pattern? searchPattern;

  @override
  State<TreeTile> createState() => _TreeTileState();
}

class _TreeTileState extends State<TreeTile> {
  late InlineSpan titleSpan;

  TextStyle? dimStyle;
  TextStyle? highlightStyle;

  bool get shouldShowBadge => !widget.entry.isExpanded && (widget.match?.subtreeMatchCount ?? 0) > 0;

  @override
  Widget build(BuildContext context) {
    return TreeIndentation(
      entry: widget.entry,
      child: Row(
        children: [
          ExpandIcon(
            key: GlobalObjectKey(widget.entry.node),
            isExpanded: widget.entry.isExpanded,
            onPressed: (_) => TreeViewScope.of<TreeNode>(context)..controller.toggleExpansion(widget.entry.node),
          ),
          if (shouldShowBadge)
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: Badge(
                label: Text('${widget.match?.subtreeMatchCount}'),
              ),
            ),
          Flexible(child: Text.rich(titleSpan)),
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setupTextStyles();
    titleSpan = buildTextSpan();
  }

  @override
  void didUpdateWidget(covariant TreeTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchPattern != widget.searchPattern || oldWidget.entry.node.title != widget.entry.node.title) {
      titleSpan = buildTextSpan();
    }
  }

  void setupTextStyles() {
    final TextStyle style = DefaultTextStyle.of(context).style;
    final Color highlightColor = Theme.of(context).colorScheme.primary;
    highlightStyle = style.copyWith(
      color: highlightColor,
      decorationColor: highlightColor,
      decoration: TextDecoration.underline,
    );
    dimStyle = style.copyWith(color: style.color?.withAlpha(128));
  }

  InlineSpan buildTextSpan() {
    final String title = widget.entry.node.title;

    if (widget.searchPattern == null) {
      return TextSpan(text: title);
    }

    final List<InlineSpan> spans = <InlineSpan>[];
    bool hasAnyMatches = false;

    title.splitMapJoin(
      widget.searchPattern!,
      onMatch: (Match match) {
        hasAnyMatches = true;
        spans.add(TextSpan(text: match.group(0)!, style: highlightStyle));
        return '';
      },
      onNonMatch: (String text) {
        spans.add(TextSpan(text: text));
        return '';
      },
    );

    if (hasAnyMatches) {
      return TextSpan(children: spans);
    }

    return TextSpan(text: title, style: dimStyle);
  }
}
