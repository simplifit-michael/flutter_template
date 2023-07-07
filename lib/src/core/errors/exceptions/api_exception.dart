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

  ApiException.fromDioError(DioError dioError)
      : super(
          code: _getCode(dioError),
          error: dioError.error,
          message: dioError.message,
          stackTrace: StackTrace.current,
        );

  @override
  String toString() {
    return '[$ApiException (code: $code, message: $message, error: $error, stackTrace: $stackTrace)]';
  }

  static DataLayerExceptionCode _getCode(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return DataLayerExceptionCode.connectTimeout;
      case DioErrorType.sendTimeout:
        return DataLayerExceptionCode.sendTimeout;
      case DioErrorType.receiveTimeout:
        return DataLayerExceptionCode.receiveTimeout;
      case DioErrorType.badResponse:
        return DataLayerExceptionCodeExtension.fromResponseCode(dioError.response?.statusCode);
      case DioErrorType.cancel:
        return DataLayerExceptionCode.cancel;
      case DioErrorType.unknown:
        return DataLayerExceptionCodeExtension.fromException(dioError.error);
      case DioErrorType.badCertificate:
        return DataLayerExceptionCode.badCertificate;
      case DioErrorType.connectionError:
        return DataLayerExceptionCode.connectionError;
    }
  }
}
