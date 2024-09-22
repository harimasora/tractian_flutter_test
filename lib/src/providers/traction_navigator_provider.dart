import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'traction_navigator_provider.g.dart';

class TractionNavigation {
  TractionNavigation(this.ref);

  final ProviderRef<TractionNavigation> ref;

  NavigatorState? get _navigator => ref.read(rootStateProvider);

  void push(String path, [Object? extra]) {
    _navigator?.pushNamed(path, arguments: extra);
  }

  void pop() {
    if (_navigator?.canPop() == true) {
      _navigator?.pop();
    } else {
      _navigator?.pushNamed('/');
    }
  }
}

final rootNavigatorKey = GlobalKey<NavigatorState>();

final rootStateProvider = Provider((ref) => rootNavigatorKey.currentState);

@riverpod
TractionNavigation tractionNavigation(TractionNavigationRef ref) {
  return TractionNavigation(ref);
}
