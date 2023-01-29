import 'package:dio/dio.dart';

class DioUsersInterceptor extends Interceptor {
  final String _apiKey;

  DioUsersInterceptor(this._apiKey);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final apiKey = await _getApiKey();
    options.headers.addAll({
      'authorization': 'Bearer $apiKey',
    });
    //If you need QueryParameters
    // options.queryParameters.addAll({
    //   'key': apiKey,
    // });
    super.onRequest(options, handler);
  }

  Future<String> _getApiKey() => Future.value(_apiKey);
}
