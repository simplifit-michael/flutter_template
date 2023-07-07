import 'package:flutter_template/src/core/app/export.dart';
import 'package:flutter_template/src/core/service/l18n.dart';
import 'package:flutter/material.dart';

class WarningPopup extends StatelessWidget {
  const WarningPopup({
    required this.descriptionKey,
    super.key,
    this.captionKey,
    this.positiveButtonKey,
    this.negativeButtonKey,
    this.namedArgs,
  });
  final String? captionKey;
  final String descriptionKey;
  final String? positiveButtonKey;
  final String? negativeButtonKey;
  final Map<String, String>? namedArgs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppUIConstraints.horizontalScreenPadding),
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.cardBackground,
              borderRadius: BorderRadius.circular(AppUIConstraints.cardRadius),
            ),
            padding: const EdgeInsets.all(AppUIConstraints.cardPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  captionKey?.tr() ?? LocaleKeys.generalWarningCaption.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                Text(
                  descriptionKey.tr(namedArgs: namedArgs),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        negativeButtonKey?.tr() ?? LocaleKeys.generalButtonCancel.tr(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(
                        positiveButtonKey?.tr() ?? LocaleKeys.generalButtonOkay.tr(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
