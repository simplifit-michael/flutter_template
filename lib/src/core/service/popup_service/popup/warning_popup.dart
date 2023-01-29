import 'package:flutter/material.dart';

import '../../../app/export.dart';
import '../../export.dart';

class WarningPopup extends StatelessWidget {
  final String? title;
  final String description;
  final String? positiveButtonLabel;
  final String? negativeButtonLabel;

  const WarningPopup({
    super.key,
    this.title,
    required this.description,
    this.positiveButtonLabel,
    this.negativeButtonLabel,
  });

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
                  title ?? S.of(context)!.generic_info_generic_title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(
                        negativeButtonLabel ??
                            S.of(context)!.generic_button_okay,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(
                        positiveButtonLabel ??
                            S.of(context)!.generic_button_okay,
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
