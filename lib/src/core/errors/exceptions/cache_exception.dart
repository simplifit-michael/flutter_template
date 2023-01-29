class CacheExceptionCode{
  CacheExceptionCode._();

  static const int unknown = -1;
  static const int cacheInvalid = -2;
  static const int dataInvalid = -3;
  static const int dataExpired = -4;
  static const int dataNotFound = -5;
}

class CacheException implements Exception {
  final int code;
  final String message;

  CacheException(this.code, this.message);
}
