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
        title: SvgPicture.asset('assets/icon/logo.svg', semanticsLabel: 'Tractian logo'),
      ),
      body: asyncCompanies.when(
        data: (companies) => ListView.separated(
          itemCount: companies.length,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 22),
          itemBuilder: (context, index) {
            final company = companies[index];
            return ListTile(
              tileColor: Color(0xFF2188FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 26, horizontal: 32),
              leading: SvgPicture.asset('assets/icon/location.svg'),
              title: Text(
                '${company.name} Unit',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              onTap: () => navigation.goToAssets(company.id),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 40),
        ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => Center(child: CircularProgressIndicator.adaptive()),
      ),
    );
  }
}
