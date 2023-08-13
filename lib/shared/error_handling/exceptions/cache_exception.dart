import 'data_layer_exception.dart';

class CacheException extends DataLayerException implements Exception {
  CacheException({
    required super.code,
    required super.message,
    required super.stackTrace,
    super.error,
  });
}
