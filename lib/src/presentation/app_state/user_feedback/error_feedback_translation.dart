import 'package:flutter/widgets.dart';
import 'package:flutter_template/src/core/service/export.dart';
import 'package:flutter_template/src/domain/app_state/entity/error_feedback.dart';

extension ErrorFeedbackTranslation on ErrorFeedback {
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
