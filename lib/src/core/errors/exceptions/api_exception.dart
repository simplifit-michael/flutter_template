import 'package:dio/dio.dart';

class ApiExceptionCode {
  ApiExceptionCode._();

  static const int noInternet = -1;
  static const int unknown = -2;
  static const int invalidResponseBody = -3;

}

enum ApiExceptionDetail {
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  cancel,
}

extension ApiExceptionDetailExtension on ApiExceptionDetail {
  static ApiExceptionDetail? fromString(String value) {
    for (var item in ApiExceptionDetail.values) {
      if (item.name == value.toLowerCase()) return item;
    }
    return null;
  }
}

class ApiException implements Exception {
  final int code;
  final ApiExceptionDetail? detail;
  final String message;

  ApiException({required this.code, required this.message, this.detail});

  ApiException.noInternet()
      : code = ApiExceptionCode.noInternet,
        message = 'No internet connection',
        detail = null;

  ApiException.fromDioError(DioError dioError)
      : code = dioError.response?.statusCode ?? ApiExceptionCode.unknown,
        message = dioError.message,
        detail = ApiExceptionDetailExtension.fromString(dioError.type.name);
}
