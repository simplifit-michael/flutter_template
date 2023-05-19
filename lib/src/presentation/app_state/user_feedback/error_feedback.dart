import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/src/core/errors/export.dart';

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

extension ErrorFeedbackExtension on ErrorFeedback {
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

  String getTitle(BuildContext context) {
    switch (this) {
      default:
        return S.of(context)!.generic_error_generic_title;
    }
  }

  String getDescription(BuildContext context, {Map<String, dynamic>? namedArgs}) {
    switch (this) {
      case ErrorFeedback.unknown:
        return S.of(context)!.generic_error_generic_description;
      case ErrorFeedback.noInternet:
        return S.of(context)!.general_error_no_internet_description;
      case ErrorFeedback.invalidResponseBody:
        return S.of(context)!.generic_error_generic_description;
      case ErrorFeedback.notFound:
        return S.of(context)!.generic_error_generic_description;
      case ErrorFeedback.internalServerError:
        return S.of(context)!.generic_error_generic_description;
      case ErrorFeedback.connectTimeout:
      case ErrorFeedback.invalidState:
        return S.of(context)!.generic_error_generic_description;
      case ErrorFeedback.missingRequiredInput:
        return S.of(context)!.general_error_missing_required_input_description;
      case ErrorFeedback.exampleWarningRefused:
        return S.of(context)!.example_error_warning_refused_description;
    }
  }

  String getButtonLabel(BuildContext context) {
    switch (this) {
      default:
        return S.of(context)!.generic_error_generic_title;
    }
  }
}
