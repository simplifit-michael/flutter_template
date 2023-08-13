import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/app_state_cubit.dart';
import '../../../widget/loading_screen.dart';
import 'popup/error_popup.dart';
import 'popup/info_popup.dart';
import 'popup/loading_popup.dart';

class AppStateHandler extends StatefulWidget {
  const AppStateHandler({required this.child, super.key});

  final Widget child;

  @override
  State<AppStateHandler> createState() => _AppStateHandlerState();
}

class _AppStateHandlerState extends State<AppStateHandler> {
  @override
  void didChangeDependencies() {
    notifyUser();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppStateCubit, AppStateState>(
      listener: (context, state) => notifyUser(),
      builder: (context, state) {
        final loadingState = state.map(
          ready: (_) => null,
          loading: (state) => state,
          error: (_) => null,
          info: (_) => null,
        );

        return Stack(
          children: [
            widget.child,
            if (loadingState != null)
              loadingState.reason?.isFullScreen ?? false
                  ? LoadingScreen(
                      iconAsset: loadingState.reason?.getAppIcon(),
                      label: loadingState.reason?.getDescription(context),
                    )
                  : const LoadingPopup(),
          ],
        );
      },
    );
  }

  void notifyUser() {
    final cubit = context.read<AppStateCubit>();
    cubit.state.map(
      ready: (_) => null,
      loading: (_) => null,
      info: (state) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => InfoPopup(
          caption: state.reason.getCaption(context),
          description: state.reason.getDescription(context),
          buttonLabel: state.reason.getButtonLabel(context),
          onConfirm: () {
            state.onConfirm?.call();
            Navigator.of(context).pop();
            cubit.reset();
          },
        ),
      ),
      error: (state) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ErrorPopup(
          caption: state.reason?.getCaption(context) ?? //
              //FIXME: Localize Fallback with your choosen l10n Strategy
              'Ups',
          description: state.reason?.getDescription(context) ?? //
              //FIXME: Localize Fallback with your choosen l10n Strategy
              'An unknown Error occured',
          buttonLabel: state.reason?.getButtonLabel(context) ?? //
              //FIXME: Localize Fallback with your choosen l10n Strategy
              'Ok',
          onConfirm: () {
            state.onConfirm?.call();
            Navigator.of(context).pop();
            cubit.reset();
          },
        ),
      ),
    );
  }
}
