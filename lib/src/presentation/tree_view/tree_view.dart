import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final treeFilter = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.treeFilter));
    final searchPattern =
        ref.watch(treeViewNotifierProvider(companyId).select((v) => RegExp(v.searchText, caseSensitive: false)));
    final treeController = ref.watch(treeControllerProvider(companyId));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assets',
          style: TextStyle(color: Colors.white),
        ),
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
                    onChanged: (text) => notifier.setSearchText(text, treeController),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFEAEFF3),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEAEFF3),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFEAEFF3),
                        ),
                      ),
                      hintText: 'Buscar Ativo ou Local',
                      hintStyle: TextStyle(
                        color: Color(0xFF8E98A3),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF8E98A3),
                      ),
                      suffixIconConstraints: BoxConstraints(maxHeight: 16),
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Badge(
                          backgroundColor: Color(0xFF2188FF),
                          isLabelVisible: treeFilter != null,
                          label: Text(
                            '${treeFilter?.totalMatchCount}/${treeFilter?.totalNodeCount}',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      _FilterToggle(
                        companyId: companyId,
                        text: 'Sensor de energia',
                        assetType: ComponentType.energy,
                        svgAssetPath: 'assets/icon/boltOutline.svg',
                      ),
                      _FilterToggle(
                        companyId: companyId,
                        text: 'Crítico',
                        assetType: ComponentType.vibration,
                        svgAssetPath: 'assets/icon/criticalCircle.svg',
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
                child: AnimatedTreeView<TreeNode>(
              treeController: treeController,
              nodeBuilder: (BuildContext context, TreeEntry<TreeNode> entry) {
                if (treeFilter != null && treeFilter.matchOf(entry.node) == null) {
                  return SizedBox.shrink();
                }
                return TreeTile(
                  entry: entry,
                  match: treeFilter?.matchOf(entry.node),
                  searchPattern: searchPattern,
                );
              },
            )),
          ],
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}

class _FilterToggle extends HookConsumerWidget {
  const _FilterToggle({
    required this.text,
    required this.companyId,
    required this.assetType,
    required this.svgAssetPath,
  });
  final String text;
  final String companyId;
  final ComponentType assetType;
  final String svgAssetPath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(treeViewNotifierProvider(companyId).notifier);
    final currentFilters = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.currentFilters));
    final treeController = ref.watch(treeControllerProvider(companyId));
    final isActive = currentFilters.contains(assetType);
    return ActionChip(
      label: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Color(0xFF77818C),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: BorderSide(
          color: isActive ? Color(0xFF2188FF) : Color(0xFFD8DFE6),
        ),
      ),
      avatar: SvgPicture.asset(
        svgAssetPath,
        colorFilter: ColorFilter.mode(isActive ? Colors.white : Color(0xFF77818C), BlendMode.srcIn),
      ),
      onPressed: () => notifier.toggleFilter(assetType, treeController),
      backgroundColor: isActive ? Color(0xFF2188FF) : Colors.transparent,
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
    final nodeIcon = switch (widget.entry.node.nodeType) {
      NodeType.asset => SvgPicture.asset('assets/icon/asset.svg'),
      NodeType.location => SvgPicture.asset('assets/icon/locationMarker.svg'),
      NodeType.component => Image.asset('assets/icon/component.png', width: 22, height: 22),
    };

    final componenTypeIcon = switch (widget.entry.node.componentType) {
      null => null,
      ComponentType.energy => SvgPicture.asset('assets/icon/bolt.svg'),
      ComponentType.vibration => SvgPicture.asset('assets/icon/critical.svg'),
    };

    return TreeIndentation(
      entry: widget.entry,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          nodeIcon,
          SizedBox(width: 4),
          Flexible(child: Text.rich(titleSpan)),
          if (componenTypeIcon case final componenTypeIcon?) ...[
            SizedBox(width: 4),
            componenTypeIcon,
          ],
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
    if (oldWidget.searchPattern != widget.searchPattern || oldWidget.entry.node.name != widget.entry.node.name) {
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
    final String title = widget.entry.node.name;

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
