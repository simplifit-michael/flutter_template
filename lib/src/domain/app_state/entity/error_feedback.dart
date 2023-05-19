import '../../../core/errors/export.dart';

enum ErrorFeedback {
  unknown,
  noInternet,
  invalidResponseBody,
  notFound,
  internalServerError,
  connectTimeout,
  invalidState,
  missingRequiredInput,
  exampleWarningRefused,
}

extension ErrorFeedbackBuilder on ErrorFeedback {
  static ErrorFeedback fromFailure(FailureType failureType) {
    switch (failureType) {
      case FailureType.unknown:
        return ErrorFeedback.unknown;
      case FailureType.noInternet:
        return ErrorFeedback.noInternet;
      case FailureType.invalidDataReceived:
        return ErrorFeedback.invalidResponseBody;
      case FailureType.notFound:
        return ErrorFeedback.notFound;
      case FailureType.internalError:
        return ErrorFeedback.internalServerError;
      case FailureType.timeout:
        return ErrorFeedback.connectTimeout;
      case FailureType.serviceDown:
        return ErrorFeedback.noInternet;
      case FailureType.redirect:
        return ErrorFeedback.unknown;
      case FailureType.invalidDataSent:
        return ErrorFeedback.missingRequiredInput;
      case FailureType.denied:
        return ErrorFeedback.unknown;
      case FailureType.conflict:
        return ErrorFeedback.unknown;
    }
  }
}
