import 'package:flutter_template/src/core/service/l18n.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_template/src/core/app/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorPopup extends StatelessWidget {
  const ErrorPopup({
    this.captionKey,
    this.descriptionKey,
    this.buttonKey,
    this.namedArgs,
    super.key,
  });
  final String? captionKey;
  final String? descriptionKey;
  final String? buttonKey;
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
                  captionKey?.tr() ?? LocaleKeys.generalErrorCaption.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                Text(
                  descriptionKey?.tr(namedArgs: namedArgs) ?? LocaleKeys.generalErrorDescription.tr(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                ElevatedButton(
                  onPressed: () {
                    context.read<AppStateCubit>().reset();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    buttonKey?.tr() ?? LocaleKeys.generalButtonOkay.tr(),
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
