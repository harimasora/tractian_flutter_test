import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'tree_view_notifier.dart';
import 'tree_view_state.dart';

class AssetsPage extends ConsumerWidget {
  const AssetsPage({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(treeViewNotifierProvider(companyId).notifier);
    final state = ref.watch(treeViewNotifierProvider(companyId));
    final items = ref.watch(treeViewNotifierProvider(companyId).select((v) => v.filteredAssets));
    return Scaffold(
      appBar: AppBar(
        title: Text('Tractian'),
        backgroundColor: Colors.blueAccent,
      ),
      body: state.response.when(
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
                            color: state.currentFilters.contains(AssetType.energy) ? Colors.white : Colors.black,
                          ),
                        ),
                        avatar: Icon(
                          Icons.bolt,
                          color: state.currentFilters.contains(AssetType.energy) ? Colors.white : Colors.black,
                        ),
                        onPressed: () => notifier.toggleFilter(AssetType.energy),
                        backgroundColor:
                            state.currentFilters.contains(AssetType.energy) ? Colors.blue : Colors.transparent,
                      ),
                      ActionChip(
                        label: Text(
                          'Crítico',
                          style: TextStyle(
                            color: state.currentFilters.contains(AssetType.vibration) ? Colors.white : Colors.black,
                          ),
                        ),
                        avatar: Icon(
                          Icons.warning_amber,
                          color: state.currentFilters.contains(AssetType.vibration) ? Colors.white : Colors.black,
                        ),
                        onPressed: () => notifier.toggleFilter(AssetType.vibration),
                        backgroundColor:
                            state.currentFilters.contains(AssetType.vibration) ? Colors.blue : Colors.transparent,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(items[index].name),
                  subtitle: Text(items[index].sensorType.toString()),
                  onTap: () {
                    print(items[index].toString());
                  },
                ),
              ),
            ),
          ],
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Text('Loading...'),
      ),
    );
  }
}
