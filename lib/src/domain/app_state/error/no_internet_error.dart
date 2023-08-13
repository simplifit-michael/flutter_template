import 'package:flutter/material.dart';

// ignore: unused_import
import '../../../core/service/l18n.dart';
import '../entity/error_reason.dart';

class NoInternetError extends ErrorReason {
  @override
  String getCaption(BuildContext context) {
    //FIXME: Localize with your choosen l10n Strategy
    return 'No Internet';
  }

  @override
  String getDescription(BuildContext context) {
    //FIXME: Localize with your choosen l10n Strategy
    return 'Ensure you have a stable internet connection';
  }
}
