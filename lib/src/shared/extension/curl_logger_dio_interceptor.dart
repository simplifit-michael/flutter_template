import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class CurlLoggerDioInterceptor extends Interceptor {
  final logger = Logger('$CurlLoggerDioInterceptor');

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions);

    return handler.next(err);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    _renderCurlRepresentation(response.requestOptions);
    return handler.next(response);
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    try {
      logger.info(_cURLRepresentation(requestOptions));
    } catch (err) {
      logger.warning(
        'unable to create a CURL representation of the requestOptions',
      );
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    final components = <String>['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      if (options.data is FormData) {
        options.data = Map.fromEntries(options.data.fields);
      }

      final data = json.encode(options.data).replaceAll('"', r'\"');
      components.add('-d "$data"');
    }

    components.add('"${options.uri}"');

    return components.join(' \\\n\t');
  }
}
