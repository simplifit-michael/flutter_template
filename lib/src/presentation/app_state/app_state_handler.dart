import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/presentation/app_state/popup/loading_popup.dart';
import 'package:flutter_template/src/presentation/app_state/user_feedback/error_feedback_translation.dart';
import 'package:flutter_template/src/presentation/app_state/user_feedback/info_feedback_translation.dart';

import 'popup_service.dart';

class AppStateHandler extends StatefulWidget {
  final Widget child;
  const AppStateHandler({super.key, required this.child});

  @override
  State<AppStateHandler> createState() => _AppStateHandlerState();
}

class _AppStateHandlerState extends State<AppStateHandler> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<AppStateCubit>();
      final state = cubit.state;
      _generatePopup(state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppStateCubit, AppStateState>(listener: (context, state) {
      _generatePopup(state);
    }, builder: (context, state) {
      final shouldDisplayLoading = state.whenOrNull(loading: () => true) ?? false;
      return Stack(children: [
        widget.child,
        if (shouldDisplayLoading)
          Container(
            color: Colors.black.withOpacity(0.3),
            child: const LoadingPopup(),
          ),
      ]);
    });
  }

  void _generatePopup(AppStateState state) {
    state.when(
      ready: () => null,
      loading: () => null,
      info: (info, args) => PopupService.of(context).displayInfo(
        description: info.getDescription(context, namedArgs: args),
        buttonLabel: info.getButtonLabel(context),
        title: info.getTitle(context),
      ),
      error: (error, args, onConfirm) => PopupService.of(context).displayError(
        description: error?.getDescription(context, namedArgs: args),
        buttonLabel: error?.getButtonLabel(context),
        title: error?.getTitle(context),
        onConfirm: onConfirm?.call,
      ),
    );
  }
}
