import 'package:dio/dio.dart';

class DioFactory {
  final Dio _dio;

  DioFactory() : _dio = Dio();

  Dio build() => _dio;

  DioFactory setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    return this;
  }

  DioFactory addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
    return this;
  }
}
