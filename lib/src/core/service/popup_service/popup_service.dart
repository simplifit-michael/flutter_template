import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'export.dart';

class PopupService {
  final BuildContext context;

  PopupService.of(this.context);

  Future<bool> displayWarning({
    String? title,
    required String description,
    String? positiveButtonLabel,
    String? negativeButtonLabel,
    bool isDismissable = false,
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: isDismissable,
          builder: (context) => WarningPopup(
            title: title ?? S.of(context)!.generic_warning_generic_title,
            description: description,
            positiveButtonLabel:
                positiveButtonLabel ?? S.of(context)!.generic_button_okay,
            negativeButtonLabel:
                negativeButtonLabel ?? S.of(context)!.generic_button_cancel,
          ),
        ) ??
        false;
  }

  Future<void> displayInfo({
    String? title,
    String? image,
    required String description,
    String? buttonLabel,
    bool isDismissable = false,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: isDismissable,
      builder: (context) => InfoPopup(
        onSubmit: () => Navigator.pop(context),
        title: title,
        description: description,
        buttonLabel: buttonLabel,
      ),
    );
  }

  Future<void> displayError({
    String? title,
    String? image,
    String? description,
    String? buttonLabel,
    bool isDismissable = false,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: isDismissable,
      builder: (context) => ErrorPopup(
        onSubmit: () => Navigator.pop(context),
        title: title,
        description:
            description,
        buttonLabel: buttonLabel,
      ),
    );
  }
}
