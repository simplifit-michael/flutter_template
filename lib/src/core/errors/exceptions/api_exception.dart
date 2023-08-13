import 'package:flutter_template/src/core/errors/exceptions/data_layer_exception.dart';
import 'package:dio/dio.dart';

class ApiException extends DataLayerException implements Exception {
  ApiException({
    required super.code,
    required super.message,
    required super.stackTrace,
    super.error,
  });

  ApiException.noInternet()
      : super(
          code: DataLayerExceptionCode.noInternet,
          message: 'No internet connection',
          stackTrace: StackTrace.current,
        );

  ApiException.serviceDown()
      : super(
          code: DataLayerExceptionCode.serviceDown,
          message: 'API Service down',
          stackTrace: StackTrace.current,
        );

  ApiException.fromDioError(DioException dioError)
      : super(
          code: _getCode(dioError),
          error: dioError.error,
          message: dioError.message,
          stackTrace: StackTrace.current,
        );

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return '[$ApiException (code: $code, message: $message, error: $error, stackTrace: $stackTrace)]';
  }

  static DataLayerExceptionCode _getCode(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return DataLayerExceptionCode.connectTimeout;
      case DioExceptionType.sendTimeout:
        return DataLayerExceptionCode.sendTimeout;
      case DioExceptionType.receiveTimeout:
        return DataLayerExceptionCode.receiveTimeout;
      case DioExceptionType.badResponse:
        return DataLayerExceptionCodeExtension //
            .fromResponseCode(dioError.response?.statusCode);
      case DioExceptionType.cancel:
        return DataLayerExceptionCode.cancel;
      case DioExceptionType.unknown:
        return DataLayerExceptionCodeExtension //
            .fromException(dioError.error);
      case DioExceptionType.badCertificate:
        return DataLayerExceptionCode.badCertificate;
      case DioExceptionType.connectionError:
        return DataLayerExceptionCode.connectionError;
    }
  }
}
