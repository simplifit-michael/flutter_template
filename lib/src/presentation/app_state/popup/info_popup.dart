import 'package:flutter/material.dart';
import '../../../core/service/export.dart';
import '/src/core/app/export.dart';

class InfoPopup extends StatelessWidget {
  final String? title;
  final String description;
  final String? buttonLabel;
  final VoidCallback onSubmit;

  const InfoPopup({super.key, this.title, required this.description, this.buttonLabel, required this.onSubmit});

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
                ElevatedButton(
                  onPressed: onSubmit,
                  child: Text(
                    buttonLabel ?? S.of(context)!.generic_button_okay,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
