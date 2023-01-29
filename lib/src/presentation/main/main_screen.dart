import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/core/errors/failures/failure.dart';
import 'package:flutter_template/src/core/service/popup_service/popup_service.dart';
import 'package:go_router/go_router.dart';

import '../../core/app/router/app_routes.dart';
import '../../domain/users/export.dart';
import '../common/export.dart';

class MainScreen extends StatelessWidget {
  static const path = '/main';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state) {
        state.when(
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
          title: const VersionLabel(),
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
                final shouldContinue = await PopupService.of(context)
                    .displayWarning(description: 'Das ist eine Warning');
                if (shouldContinue) {
                  print('Accepted Warning');
                } else {
                  print('Refused Warning');
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
          error: (failureType) => Center(child: Text(failureType.name)),
          ready: (users) => ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.person),
              title: Text(users[index].name),
              trailing: Text(users[index].id),
              onTap: () =>
                  context.go('$path/${DetailScreen.path}/${users[index].id}'),
            ),
            itemCount: users.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            state.when(
              initial: () => Icons.start,
              error: (_) => Icons.start,
              ready: (_) => Icons.close,
            ),
          ),
          onPressed: () => context.read<UsersBloc>().add(state.when(
              initial: () => const UsersEvent.init(),
              error: (_) => const UsersEvent.init(),
              ready: (_) => const UsersEvent.reset())),
        ),
      ),
    );
  }
}
