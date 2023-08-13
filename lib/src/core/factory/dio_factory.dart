// ignore_for_file: avoid_returning_this

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioFactory {
  DioFactory() : _dio = Dio();

  final Dio _dio;

  Dio build() => _dio;

  DioFactory setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    return this;
  }

  DioFactory addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
    return this;
  }

  DioFactory addDebugInterceptor(Interceptor interceptor) {
    if (kDebugMode) {
      _dio.interceptors.add(interceptor);
    }
    return this;
  }

  DioFactory setTimeout({
    Duration? connectTimeout,
    Duration? sendTimeout,
    Duration? receiveTimeout,
  }) {
    _dio.options.connectTimeout = connectTimeout;
    _dio.options.sendTimeout = sendTimeout;
    _dio.options.receiveTimeout = receiveTimeout;
    return this;
  }
}
