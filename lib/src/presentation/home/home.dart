import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_navigation.dart';
import 'home_notifier.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.read(homeNavigationProvider);
    final asyncCompanies = ref.watch(homeNotifierProvider.select((state) => state.response));
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/icon/logo.svg', semanticsLabel: 'Acme Logo'),
      ),
      body: asyncCompanies.when(
        data: (companies) => ListView.builder(
          itemCount: companies.length,
          itemBuilder: (context, index) {
            final company = companies[index];
            return ListTile(
              title: Text(company.name),
              subtitle: Text(company.id),
              onTap: () => navigation.goToAssets(company.id),
            );
          },
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Text('Loading...'),
      ),
    );
  }
}
