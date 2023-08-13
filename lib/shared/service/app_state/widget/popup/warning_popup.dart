import 'package:flutter_template/app/export.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/export.dart';

class WarningPopup extends StatelessWidget {
  const WarningPopup({
    required this.caption,
    required this.description,
    required this.positiveButtonLabel,
    required this.negativeButtonLabel,
    super.key,
  });

  final String caption;
  final String description;
  final String positiveButtonLabel;
  final String negativeButtonLabel;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: allPadding24,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColor.cardBackground,
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s16)),
            ),
            padding: allPadding16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  caption,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
                verticalMargin16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: Text(negativeButtonLabel),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: Text(positiveButtonLabel),
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
