import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/fake_api.dart';

class AssetsPage extends ConsumerWidget {
  const AssetsPage({super.key, required this.companyId});

  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(assetsProvider(companyId));
    return Scaffold(
      appBar: AppBar(
        title: Text('Tractian'),
        backgroundColor: Colors.blueAccent,
      ),
      body: assets.when(
        data: (assets) => ListView.builder(
          itemCount: assets.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(assets[index].name),
            subtitle: Text(assets[index].id),
            onTap: () {
              print(assets[index].toString());
            },
          ),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Text('Loading...'),
      ),
    );
  }
}
