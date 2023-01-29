import 'package:flutter/material.dart';

import '../../service/export.dart';
import '../export.dart';

enum FailureType {
  //General
  unknown,
  //Remote Data Source
  noInternetConnection,
  invalidResponseBody,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  //Local Data Source
  cacheInvalid,
  dataInvalid,
  dataExpired,
  dataNotFound,
}

extension FailureTypeExtension on FailureType {
  String buildUIDescription(BuildContext context) {
    switch (this) {
      case FailureType.unknown:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.noInternetConnection:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.invalidResponseBody:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.noContent:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.badRequest:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.forbidden:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.unauthorized:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.notFound:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.internalServerError:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.connectTimeout:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.cancel:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.receiveTimeout:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.sendTimeout:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.cacheInvalid:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.dataInvalid:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.dataExpired:
        return S.of(context)!.generic_error_generic_description;
      case FailureType.dataNotFound:
        return S.of(context)!.generic_error_generic_description;
    }
  }

  static FailureType fromException(Exception e) {
    if (e is ApiException) return _failureFromApiException(e);
    if (e is CacheException) return _failureFromCacheException(e);
    return FailureType.unknown;
  }

  static FailureType _failureFromApiException(ApiException e) {
    switch (e.code) {
      case ApiExceptionCode.invalidResponseBody:
        return FailureType.invalidResponseBody;
      case ApiExceptionCode.noInternet:
        return FailureType.noInternetConnection;
      case ApiExceptionCode.unknown:
        return FailureType.unknown;
      case 204:
        return FailureType.noContent;
      case 400:
        return FailureType.badRequest;
      case 401:
        return FailureType.unauthorized;
      case 403:
        return FailureType.forbidden;
      case 404:
        return FailureType.notFound;
      case 500:
        return FailureType.internalServerError;
      case 0:
        switch (e.detail!) {
          case ApiExceptionDetail.connectTimeout:
            return FailureType.connectTimeout;
          case ApiExceptionDetail.sendTimeout:
            return FailureType.sendTimeout;
          case ApiExceptionDetail.receiveTimeout:
            return FailureType.receiveTimeout;
          case ApiExceptionDetail.cancel:
            return FailureType.cancel;
          default:
            return FailureType.unknown;
        }
      default:
        return FailureType.unknown;
    }
  }

  static FailureType _failureFromCacheException(CacheException e) {
    switch (e.code) {
      case CacheExceptionCode.cacheInvalid:
        return FailureType.cacheInvalid;
      case CacheExceptionCode.dataExpired:
        return FailureType.dataExpired;
      case CacheExceptionCode.dataInvalid:
        return FailureType.dataInvalid;
      case CacheExceptionCode.dataNotFound:
        return FailureType.dataNotFound;
      case CacheExceptionCode.unknown:
        return FailureType.unknown;
      default:
        return FailureType.unknown;
    }
  }
}
