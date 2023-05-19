import 'package:flutter/material.dart';
import 'package:flutter_template/src/core/service/export.dart';
import 'package:flutter_template/src/domain/app_state/entity/info_feedback.dart';

extension InfoFeedbackTranslation on InfoFeedback {
  String getTitle(BuildContext context) {
    switch (this) {
      default:
        return S.of(context)!.generic_info_generic_title;
    }
  }

  String getDescription(BuildContext context, {Map<String, dynamic>? namedArgs}) {
    switch (this) {
      case InfoFeedback.example:
        return S.of(context)!.generic_info_generic_title;
      case InfoFeedback.exampleResettedUsers:
        return S.of(context)!.generic_info_generic_title;
      case InfoFeedback.exampleWarningAccepted:
        return S.of(context)!.example_info_warning_accepted_description;
      case InfoFeedback.exampleUsersFetched:
        return S.of(context)!.example_info_users_fetched_description(namedArgs!['userCount']);
    }
  }

  String getButtonLabel(BuildContext context) {
    switch (this) {
      default:
        return S.of(context)!.generic_button_okay;
    }
  }
}
