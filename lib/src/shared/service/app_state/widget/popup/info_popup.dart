import 'package:flutter/material.dart';

import '../../../../../presentation/app/export.dart';
import '../../../../../../generated/export.dart';

class InfoPopup extends StatelessWidget {
  const InfoPopup({
    required this.caption,
    required this.description,
    required this.buttonLabel,
    required this.onConfirm,
    super.key,
  });
  final String caption;
  final String description;
  final String buttonLabel;
  final VoidCallback onConfirm;

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
                ElevatedButton(
                  onPressed: onConfirm,
                  child: Text(buttonLabel),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
