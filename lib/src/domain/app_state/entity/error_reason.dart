import 'package:flutter/material.dart';

// ignore: unused_import
import '../../../core/service/l18n.dart';

abstract class ErrorReason {
  String getCaption(BuildContext context) {
    //FIXME: Localize with your choosen l10n Strategy
    return 'Ups';
  }

  String getDescription(BuildContext context);
  String getButtonLabel(BuildContext context) {
    //FIXME: Localize with your choosen l10n Strategy
    return 'Ok';
  }
}
