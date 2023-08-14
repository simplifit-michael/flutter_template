// ignore_for_file: lines_longer_than_80_chars

import '../exceptions/data_layer_exception.dart';

enum FailureType {
  unknown,
  noInternet,
  serviceDown,
  invalidDataReceived,
  notFound,
  internalError,
  timeout,
  redirect,
  invalidDataSent,
  denied,
  conflict,
}

extension FailureTypeExtension on FailureType {
  static FailureType fromException(Exception e) {
    if (e is DataLayerException) return _failureFromDataLayerException(e);
    return FailureType.unknown;
  }

  static FailureType _failureFromDataLayerException(DataLayerException e) {
    switch (e.code) {
      //General
      case DataLayerExceptionCode.unknown:
        return FailureType.unknown;
      case DataLayerExceptionCode.other:
        return FailureType.unknown;

      //Cache
      case DataLayerExceptionCode.dataExpired:
        return FailureType.invalidDataReceived;
      case DataLayerExceptionCode.dataNotFound:
        return FailureType.notFound;
      case DataLayerExceptionCode.dataInvalid:
        return FailureType.invalidDataReceived;

      //Remote
      case DataLayerExceptionCode.serviceDown:
        return FailureType.serviceDown;
      case DataLayerExceptionCode.invalidResponseBody:
        return FailureType.invalidDataReceived;
      case DataLayerExceptionCode.noInternet:
        return FailureType.noInternet;
      case DataLayerExceptionCode.connectTimeout:
        return FailureType.timeout;
      case DataLayerExceptionCode.sendTimeout:
        return FailureType.timeout;
      case DataLayerExceptionCode.receiveTimeout:
        return FailureType.timeout;
      case DataLayerExceptionCode.cancel:
        return FailureType.unknown;
      case DataLayerExceptionCode.badCertificate:
        return FailureType.unknown;
      case DataLayerExceptionCode.connectionError:
        return FailureType.unknown;

      //StatusCodes: 200
      case DataLayerExceptionCode.noContent:
        return FailureType.notFound;
      //StatusCodes: 300
      case DataLayerExceptionCode.multipleChoices:
        return FailureType.redirect;
      case DataLayerExceptionCode.movedPermanently:
        return FailureType.redirect;
      case DataLayerExceptionCode.found:
        return FailureType.redirect;
      case DataLayerExceptionCode.seeOther:
        return FailureType.redirect;
      case DataLayerExceptionCode.notModified:
        return FailureType.redirect;
      case DataLayerExceptionCode.useProxy:
        return FailureType.redirect;
      case DataLayerExceptionCode.temporaryRedirect:
        return FailureType.redirect;
      case DataLayerExceptionCode.permanentRedirect:
        return FailureType.redirect;
      //StatusCodes: 400
      case DataLayerExceptionCode.badRequest:
        return FailureType.invalidDataSent;
      case DataLayerExceptionCode.unauthorized:
        return FailureType.denied;
      case DataLayerExceptionCode.paymentRequired:
        return FailureType.unknown;
      case DataLayerExceptionCode.forbidden:
        return FailureType.denied;
      case DataLayerExceptionCode.notFound:
        return FailureType.notFound;
      case DataLayerExceptionCode.methodNotAllowed:
        return FailureType.denied;
      case DataLayerExceptionCode.notAcceptable:
        return FailureType.denied;
      case DataLayerExceptionCode.proxyAuthenticationRequired:
        return FailureType.denied;
      case DataLayerExceptionCode.requestTimeout:
        return FailureType.timeout;
      case DataLayerExceptionCode.conflict:
        return FailureType.conflict;
      case DataLayerExceptionCode.gone:
        return FailureType.unknown;
      case DataLayerExceptionCode.lengthRequired:
        return FailureType.unknown;
      case DataLayerExceptionCode.preconditionFailed:
        return FailureType.unknown;
      case DataLayerExceptionCode.payloadTooLarge:
        return FailureType.unknown;
      case DataLayerExceptionCode.uriTooLong:
        return FailureType.unknown;
      case DataLayerExceptionCode.unsupportedMediaType:
        return FailureType.unknown;
      case DataLayerExceptionCode.rangeNotSatisfiable:
        return FailureType.unknown;
      case DataLayerExceptionCode.expectationFailed:
        return FailureType.unknown;
      case DataLayerExceptionCode.imATeapot:
        return FailureType.unknown;
      case DataLayerExceptionCode.policyNotFulfilled:
        return FailureType.unknown;
      case DataLayerExceptionCode.misdirectedRequest:
        return FailureType.unknown;
      case DataLayerExceptionCode.unprocessableEntity:
        return FailureType.unknown;
      case DataLayerExceptionCode.locked:
        return FailureType.unknown;
      case DataLayerExceptionCode.failedDependency:
        return FailureType.unknown;
      case DataLayerExceptionCode.tooEarly:
        return FailureType.unknown;
      case DataLayerExceptionCode.upgradeRequired:
        return FailureType.unknown;
      case DataLayerExceptionCode.preconditionRequired:
        return FailureType.unknown;
      case DataLayerExceptionCode.tooManyRequests:
        return FailureType.denied;
      case DataLayerExceptionCode.requestHeaderFieldsTooLarge:
        return FailureType.unknown;
      case DataLayerExceptionCode.noResponse:
        return FailureType.unknown;
      case DataLayerExceptionCode.theRequestShouldBeRetriedAfterDoingTheAppropriateAction:
        return FailureType.unknown;
      case DataLayerExceptionCode.unavailableForLegalReasons:
        return FailureType.unknown;
      case DataLayerExceptionCode.clientClosedRequest:
        return FailureType.unknown;
      //StatusCodes: 500
      case DataLayerExceptionCode.internalServerError:
        return FailureType.internalError;
      case DataLayerExceptionCode.notImplemented:
        return FailureType.internalError;
      case DataLayerExceptionCode.badGateway:
        return FailureType.serviceDown;
      case DataLayerExceptionCode.serviceUnavailable:
        return FailureType.serviceDown;
      case DataLayerExceptionCode.gatewayTimeout:
        return FailureType.timeout;
      case DataLayerExceptionCode.httpVersionNotSupported:
        return FailureType.unknown;
      case DataLayerExceptionCode.variantAlsoNegotiates:
        return FailureType.unknown;
      case DataLayerExceptionCode.insufficientStorage:
        return FailureType.unknown;
      case DataLayerExceptionCode.loopDetected:
        return FailureType.unknown;
      case DataLayerExceptionCode.bandwidthLimitExceeded:
        return FailureType.unknown;
      case DataLayerExceptionCode.notExtended:
        return FailureType.unknown;
      case DataLayerExceptionCode.networkAuthenticationRequired:
        return FailureType.denied;
    }
  }
}
