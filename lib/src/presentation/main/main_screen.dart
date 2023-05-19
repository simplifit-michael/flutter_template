import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';
import 'package:flutter_template/src/presentation/app_state/popup_service.dart';
import 'package:flutter_template/src/domain/app_state/entity/error_feedback.dart';
import 'package:flutter_template/src/domain/app_state/entity/info_feedback.dart';
import 'package:flutter_template/src/presentation/app_state/app_state_handler.dart';
import 'package:go_router/go_router.dart';

import '../../core/service/export.dart';
import '../../core/app/router/app_routes.dart';
import '../../domain/users/export.dart';

class MainScreen extends StatelessWidget {
  static const path = '/main';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateHandler(
      child: BlocConsumer<UsersBloc, UsersState>(
        listener: (context, state) {
          final authState = context.read<AuthBloc>().state;
          if (!authState.isLoggedIn) return;
          state.whenOrNull(
            initial: () =>
                context.read<AppStateCubit>().add(const AppStateEvent.setInfo(info: InfoFeedback.exampleResettedUsers)),
            ready: (users) => context.read<AppStateCubit>().add(
                  AppStateEvent.setInfo(
                    info: InfoFeedback.exampleUsersFetched,
                    namedArgs: {"userCount": users.length},
                  ),
                ),
          );
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => context.read<AuthBloc>().add(const AuthEvent.signOut()),
            ),
            title: Text(S.of(context)!.app_title),
            centerTitle: false,
            actions: [
              IconButton(
                onPressed: () {
                  context.read<AppStateCubit>().add(const AppStateEvent.setInfo(info: InfoFeedback.example));
                },
                icon: const Icon(Icons.info_outline, color: Colors.white),
              ),
              IconButton(
                onPressed: () async {
                  final translator = S.of(context)!;
                  final popupService = PopupService.of(context);
                  final appState = context.read<AppStateCubit>();
                  final shouldContinue = await popupService.displayWarning(
                    description: translator.example_warning_description,
                    positiveButtonLabel: translator.generic_button_yes,
                    negativeButtonLabel: translator.generic_button_no,
                  );
                  if (shouldContinue) {
                    appState.add(const AppStateEvent.setInfo(info: InfoFeedback.exampleWarningAccepted));
                  } else {
                    appState.add(const AppStateEvent.setError(error: ErrorFeedback.exampleWarningRefused));
                  }
                },
                icon: const Icon(Icons.warning_outlined, color: Colors.yellow),
              ),
              IconButton(
                onPressed: () {
                  context.read<AppStateCubit>().add(const AppStateEvent.setError(error: ErrorFeedback.unknown));
                },
                icon: const Icon(Icons.error_outline, color: Colors.red),
              ),
            ],
          ),
          body: state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator.adaptive()),
            ready: (users) => RefreshIndicator(
              onRefresh: () async {
                final bloc = context.read<UsersBloc>();
                bloc.add(const UsersEvent.refresh());
                await bloc.stream.first;
              },
              child: ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(users[index].avatar),
                  ),
                  title: Text(users[index].name),
                  trailing: Text(users[index].id),
                  onTap: () => context.go('$path/${UserDetailScreen.path}/${users[index].id}'),
                ),
                itemCount: users.length,
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              state.when(
                initial: () => Icons.start,
                loading: () => Icons.hourglass_top,
                ready: (_) => Icons.close,
              ),
            ),
            onPressed: () => state.when(
                loading: () => null,
                initial: () => context.read<UsersBloc>().add(const UsersEvent.init()),
                ready: (_) => context.read<UsersBloc>().add(const UsersEvent.reset())),
          ),
        ),
      ),
    );
  }
}
