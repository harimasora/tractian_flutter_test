import 'package:go_router/go_router.dart';

import '../presentation/tree_view/tree_view.dart';
import '../presentation/home/home.dart';

List<RouteBase> get routes => [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/assets/:companyId',
        builder: (context, state) => AssetsPage(
          companyId: state.pathParameters['companyId']!,
        ),
      ),
    ];
