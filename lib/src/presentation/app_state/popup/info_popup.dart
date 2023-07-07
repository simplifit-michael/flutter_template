import 'package:flutter_template/src/core/service/l18n.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/src/core/app/export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPopup extends StatelessWidget {
  const InfoPopup({
    required this.messageKey,
    super.key,
    this.captionKey,
    this.buttonkey,
    this.namedArgs,
  });
  final String? captionKey;
  final String messageKey;
  final String? buttonkey;
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
                  captionKey?.tr() ?? LocaleKeys.generalInfoGenericCaption.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                Text(
                  messageKey.tr(namedArgs: namedArgs),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppUIConstraints.spacing),
                ElevatedButton(
                  onPressed: () {
                    context.read<AppStateCubit>().reset();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    buttonkey?.tr() ?? LocaleKeys.generalButtonOkay.tr(),
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
