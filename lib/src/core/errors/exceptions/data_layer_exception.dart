import 'dart:io';

abstract class DataLayerException implements Exception {
  final DataLayerExceptionCode code;
  final String? message;
  final dynamic error;
  final StackTrace stackTrace;

  DataLayerException({
    required this.code,
    required this.stackTrace,
    this.message,
    this.error,
  });
}

enum DataLayerExceptionCode {
  //general
  unknown,
  other,

  //local
  dataExpired,
  dataNotFound,
  dataInvalid,

  //remote
  noInternet,
  invalidResponseBody,
  serviceDown,
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  cancel,
  badCertificate,
  connectionError,

  //Status Code: 200
  noContent,

  //Status Code: 300
  multipleChoices,
  movedPermanently,
  found,
  seeOther,
  notModified,
  useProxy,
  temporaryRedirect,
  permanentRedirect,
  //Status Code: 400
  badRequest,
  unauthorized,
  paymentRequired,
  forbidden,
  notFound,
  methodNotAllowed,
  notAcceptable,
  proxyAuthenticationRequired,
  requestTimeout,
  conflict,
  gone,
  lengthRequired,
  preconditionFailed,
  payloadTooLarge,
  uriTooLong,
  unsupportedMediaType,
  rangeNotSatisfiable,
  expectationFailed,
  imATeapot,
  policyNotFulfilled,
  misdirectedRequest,
  unprocessableEntity,
  locked,
  failedDependency,
  tooEarly,
  upgradeRequired,
  preconditionRequired,
  tooManyRequests,
  requestHeaderFieldsTooLarge,
  noResponse,
  theRequestShouldBeRetriedAfterDoingTheAppropriateAction,
  unavailableForLegalReasons,
  clientClosedRequest,
  //Status Code: 500
  internalServerError,
  notImplemented,
  badGateway,
  serviceUnavailable,
  gatewayTimeout,
  httpVersionNotSupported,
  variantAlsoNegotiates,
  insufficientStorage,
  loopDetected,
  bandwidthLimitExceeded,
  notExtended,
  networkAuthenticationRequired,
}

extension DataLayerExceptionCodeExtension on DataLayerExceptionCode {
  bool isRedirect() {
    return [
      DataLayerExceptionCode.multipleChoices,
      DataLayerExceptionCode.movedPermanently,
      DataLayerExceptionCode.found,
      DataLayerExceptionCode.seeOther,
      DataLayerExceptionCode.notModified,
      DataLayerExceptionCode.useProxy,
      DataLayerExceptionCode.temporaryRedirect,
      DataLayerExceptionCode.permanentRedirect,
    ].contains(this);
  }

  static DataLayerExceptionCode fromException(dynamic error) {
    if (error is FormatException) return DataLayerExceptionCode.invalidResponseBody;
    if (error is SocketException) return DataLayerExceptionCode.noInternet;
    return DataLayerExceptionCode.unknown;
  }

  static DataLayerExceptionCode fromResponseCode(int? statusCode) {
    if (statusCode == 300) return DataLayerExceptionCode.multipleChoices;
    if (statusCode == 301) return DataLayerExceptionCode.movedPermanently;
    if (statusCode == 302) return DataLayerExceptionCode.found;
    if (statusCode == 303) return DataLayerExceptionCode.seeOther;
    if (statusCode == 304) return DataLayerExceptionCode.notModified;
    if (statusCode == 305) return DataLayerExceptionCode.useProxy;
    if (statusCode == 307) return DataLayerExceptionCode.temporaryRedirect;
    if (statusCode == 308) return DataLayerExceptionCode.permanentRedirect;
    if (statusCode == 400) return DataLayerExceptionCode.badRequest;
    if (statusCode == 401) return DataLayerExceptionCode.unauthorized;
    if (statusCode == 402) return DataLayerExceptionCode.paymentRequired;
    if (statusCode == 403) return DataLayerExceptionCode.forbidden;
    if (statusCode == 404) return DataLayerExceptionCode.notFound;
    if (statusCode == 405) return DataLayerExceptionCode.methodNotAllowed;
    if (statusCode == 406) return DataLayerExceptionCode.notAcceptable;
    if (statusCode == 407) return DataLayerExceptionCode.proxyAuthenticationRequired;
    if (statusCode == 408) return DataLayerExceptionCode.requestTimeout;
    if (statusCode == 409) return DataLayerExceptionCode.conflict;
    if (statusCode == 410) return DataLayerExceptionCode.gone;
    if (statusCode == 411) return DataLayerExceptionCode.lengthRequired;
    if (statusCode == 412) return DataLayerExceptionCode.preconditionFailed;
    if (statusCode == 413) return DataLayerExceptionCode.payloadTooLarge;
    if (statusCode == 414) return DataLayerExceptionCode.uriTooLong;
    if (statusCode == 415) return DataLayerExceptionCode.unsupportedMediaType;
    if (statusCode == 416) return DataLayerExceptionCode.rangeNotSatisfiable;
    if (statusCode == 417) return DataLayerExceptionCode.expectationFailed;
    if (statusCode == 418) return DataLayerExceptionCode.imATeapot;
    if (statusCode == 420) return DataLayerExceptionCode.policyNotFulfilled;
    if (statusCode == 421) return DataLayerExceptionCode.misdirectedRequest;
    if (statusCode == 422) return DataLayerExceptionCode.unprocessableEntity;
    if (statusCode == 423) return DataLayerExceptionCode.locked;
    if (statusCode == 424) return DataLayerExceptionCode.failedDependency;
    if (statusCode == 425) return DataLayerExceptionCode.tooEarly;
    if (statusCode == 426) return DataLayerExceptionCode.upgradeRequired;
    if (statusCode == 428) return DataLayerExceptionCode.preconditionRequired;
    if (statusCode == 429) return DataLayerExceptionCode.tooManyRequests;
    if (statusCode == 431) return DataLayerExceptionCode.requestHeaderFieldsTooLarge;
    if (statusCode == 444) return DataLayerExceptionCode.noResponse;
    if (statusCode == 449) return DataLayerExceptionCode.theRequestShouldBeRetriedAfterDoingTheAppropriateAction;
    if (statusCode == 451) return DataLayerExceptionCode.unavailableForLegalReasons;
    if (statusCode == 499) return DataLayerExceptionCode.clientClosedRequest;
    if (statusCode == 500) return DataLayerExceptionCode.internalServerError;
    if (statusCode == 501) return DataLayerExceptionCode.notImplemented;
    if (statusCode == 502) return DataLayerExceptionCode.badGateway;
    if (statusCode == 503) return DataLayerExceptionCode.serviceUnavailable;
    if (statusCode == 504) return DataLayerExceptionCode.gatewayTimeout;
    if (statusCode == 505) return DataLayerExceptionCode.httpVersionNotSupported;
    if (statusCode == 506) return DataLayerExceptionCode.variantAlsoNegotiates;
    if (statusCode == 507) return DataLayerExceptionCode.insufficientStorage;
    if (statusCode == 508) return DataLayerExceptionCode.loopDetected;
    if (statusCode == 509) return DataLayerExceptionCode.bandwidthLimitExceeded;
    if (statusCode == 510) return DataLayerExceptionCode.notExtended;
    if (statusCode == 511) return DataLayerExceptionCode.networkAuthenticationRequired;
    return DataLayerExceptionCode.unknown;
  }

  bool isLocal() => [
        DataLayerExceptionCode.dataInvalid,
        DataLayerExceptionCode.dataExpired,
        DataLayerExceptionCode.dataNotFound,
      ].contains(this);
}
