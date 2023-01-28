import 'package:dio/dio.dart';

class DioUsersInterceptor extends Interceptor {
  final String _apiKey;

  DioUsersInterceptor(this._apiKey);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err);
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      'x-api-key': _apiKey,
    });
    options.queryParameters.addAll({
      'key': _apiKey,
    });
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}