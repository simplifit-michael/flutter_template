import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/export.dart';
import '../../generated/app_margin.dart';
import '../../generated/app_size.dart';
import '../service/app_state/cubit/app_state_cubit.dart';
import 'loading_screen.dart';

class ErrorScreenData {
  const ErrorScreenData({
    required this.appIcon,
    required this.description,
    required this.positiveButtonLabel,
    required this.onPositiveTap,
    required this.negativeButtonLabel,
    required this.onNegativeTap,
  }) : assert(
          (negativeButtonLabel == null && onNegativeTap == null) ||
              (negativeButtonLabel != null && onNegativeTap != null),
          'Initialize both negativeButtonLabel and onNegativeTap or none of them',
        );
  final String appIcon;
  final String description;
  final String positiveButtonLabel;
  final VoidCallback onPositiveTap;
  final String? negativeButtonLabel;
  final VoidCallback? onNegativeTap;
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.data, super.key});
  static const path = '/error';
  final ErrorScreenData data;

  @override
  Widget build(BuildContext context) {
    final hasNegative = data.onNegativeTap != null;
    return BlocBuilder<AppStateCubit, AppStateState>(
      builder: (context, state) {
        final loadingState = state.map(
          ready: (_) => null,
          loading: (state) => state,
          error: (_) => null,
          info: (_) => null,
        );

        if (loadingState != null) {
          return LoadingScreen(
            iconAsset: loadingState.reason?.getAppIcon(),
            label: loadingState.reason?.getDescription(context),
          );
        }
        return Scaffold(
          backgroundColor: AppColor.background,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  data.appIcon,
                  theme: const SvgTheme(currentColor: AppColor.error),
                  height: AppSize.s120,
                ),
                verticalMargin8,
                Text(
                  data.description,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                verticalMargin48,
                ElevatedButton(
                  onPressed: data.onPositiveTap,
                  child: Text(data.positiveButtonLabel),
                ),
                if (hasNegative) ...[
                  verticalMargin16,
                  TextButton(
                    onPressed: data.onNegativeTap,
                    child: Text(data.negativeButtonLabel!),
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
