import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/fake_api.dart';
import 'home_state.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    final response = ref.watch(companiesProvider);
    return HomeState(response: response);
  }

  void refresh() {
    ref.invalidate(companiesProvider);
  }
}
