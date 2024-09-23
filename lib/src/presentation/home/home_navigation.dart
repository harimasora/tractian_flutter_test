import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../providers/traction_navigator_provider.dart';

part 'home_navigation.g.dart';

class HomeNavigation {
  HomeNavigation(this._navigation);

  final TractionNavigation _navigation;

  void goToAssets(String companyId) => _navigation.push('/assets/$companyId');
}

@riverpod
HomeNavigation homeNavigation(HomeNavigationRef ref) {
  return HomeNavigation(
    ref.read(tractionNavigationProvider),
  );
}
