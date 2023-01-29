import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/service/export.dart';
import '/src/core/errors/export.dart';
import '../../core/app/router/app_routes.dart';
import '../../domain/users/export.dart';

class MainScreen extends StatelessWidget {
  static const path = '/main';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state) {
        state.whenOrNull(
          initial: () => PopupService.of(context)
              .displayInfo(description: 'Resetted State'),
          ready: (users) => PopupService.of(context)
              .displayInfo(description: 'Fetched ${users.length} users'),
          error: (failure) => PopupService.of(context)
              .displayError(description: failure.buildUIDescription(context)),
        );
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context)!.app_title),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: () {
                PopupService.of(context)
                    .displayInfo(description: 'Das ist eine Info');
              },
              icon: const Icon(Icons.info_outline, color: Colors.white),
            ),
            IconButton(
              onPressed: () async {
                final popupService = PopupService.of(context);
                final shouldContinue = await popupService.displayWarning(
                    description: 'Das ist eine Warning');
                if (shouldContinue) {
                  popupService.displayInfo(description: 'Accepted Warning');
                } else {
                  popupService.displayError(description: 'Refused Warning');
                }
              },
              icon: const Icon(Icons.warning_outlined, color: Colors.yellow),
            ),
            IconButton(
              onPressed: () {
                PopupService.of(context)
                    .displayError(description: 'Das ist ein Error');
              },
              icon: const Icon(Icons.error_outline, color: Colors.red),
            ),
          ],
        ),
        body: state.when(
          initial: () => Container(),
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          error: (failureType) =>
              Center(child: Text(failureType.buildUIDescription(context))),
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
                onTap: () => context
                    .go('$path/${UserDetailScreen.path}/${users[index].id}'),
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
              error: (_) => Icons.start,
              ready: (_) => Icons.close,
            ),
          ),
          onPressed: () => state.when(
              loading: () => null,
              initial: () =>
                  context.read<UsersBloc>().add(const UsersEvent.init()),
              error: (_) =>
                  context.read<UsersBloc>().add(const UsersEvent.init()),
              ready: (_) =>
                  context.read<UsersBloc>().add(const UsersEvent.reset())),
        ),
      ),
    );
  }
}
