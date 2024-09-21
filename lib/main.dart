import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tractian_flutter_test/src/data/fake_api.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(companiesProvider);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tractian'),
          backgroundColor: Colors.blueAccent,
        ),
        body: companies.when(
          data: (companies) => ListView.builder(
            itemCount: companies.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(companies[index].name),
              subtitle: Text(companies[index].id),
              onTap: () => print('tap ${companies[index].toString()}'),
            ),
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Text('Loading...'),
        ),
      ),
    );
  }
}
