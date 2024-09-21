import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../config/api.dart';

part 'dio_provider.g.dart';

@riverpod
bool isRelease(IsReleaseRef ref) {
  return kReleaseMode;
}

@riverpod
String apiUrl(ApiUrlRef ref) {
  final isRelease = ref.read(isReleaseProvider);
  final baseUrl = isRelease ? Api.baseProductionUrl : Api.baseTestUrl;
  return baseUrl;
}

@riverpod
Dio dio(DioRef ref) {
  final options = BaseOptions(
    baseUrl: ref.read(apiUrlProvider),
    headers: {
      'Accept': 'application/json',
    },
  );

  final dio = Dio(options);
  return dio;
}
