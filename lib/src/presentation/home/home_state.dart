import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/company.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(AsyncValue<List<Company>>.loading()) AsyncValue<List<Company>> response,
    @Default(false) bool loading,
  }) = _HomeState;
}
