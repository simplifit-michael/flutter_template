import 'package:flutter_template/src/presentation/app_state/popup/error_popup.dart';
import 'package:flutter_template/src/presentation/app_state/popup/info_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_cubit.dart';
import 'package:flutter_template/src/presentation/app_state/popup/loading_popup.dart';

class AppStateHandler extends StatelessWidget {
  const AppStateHandler({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppStateCubit, AppStateState>(
      listener: (context, state) {
        state.map(
          ready: (_) => null,
          loading: (_) => null,
          info: (state) => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => InfoPopup(
              messageKey: state.messageKey,
              buttonkey: state.buttonKey,
              captionKey: state.captionKey,
              namedArgs: state.namedArgs,
            ),
          ),
          error: (state) => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => ErrorPopup(
              descriptionKey: state.messageKey,
              buttonKey: state.buttonKey,
              captionKey: state.captionKey,
              namedArgs: state.namedArgs,
            ),
          ),
        );
      },
      builder: (context, state) {
        return Stack(
          children: [
            child,
            if (state.isLoading)
              ColoredBox(
                color: Colors.black.withOpacity(0.3),
                child: const LoadingPopup(),
              ),
          ],
        );
      },
    );
  }
}
