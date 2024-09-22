import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router_provider.dart';

part 'traction_navigator_provider.g.dart';

class TractionNavigation {
  TractionNavigation(this.ref);

  final ProviderRef<TractionNavigation> ref;

  GoRouter get _router => ref.read(routerProvider);

  void push(String path, [Object? extra]) {
    _router.push(path, extra: extra);
  }

  void pop() {
    if (_router.canPop() == true) {
      _router.pop();
    } else {
      _router.push('/');
    }
  }
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final rootStateProvider = Provider((ref) => rootNavigatorKey.currentState);

@riverpod
TractionNavigation tractionNavigation(TractionNavigationRef ref) {
  return TractionNavigation(ref);
}
