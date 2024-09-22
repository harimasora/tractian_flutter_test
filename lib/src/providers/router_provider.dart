import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../navigation/routes.dart';
import 'traction_navigator_provider.dart';

final routerProvider = Provider.autoDispose((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: routes,
  );
});
