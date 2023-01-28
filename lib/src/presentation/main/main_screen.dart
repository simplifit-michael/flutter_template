import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.when(
                initial: () => 'Users reseted',
                ready: (_) => 'Users requested')),
            behavior: SnackBarBehavior.floating,
          ),
        );
      },
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const VersionLabel()),
        body: state.when(
          initial: () => Container(),
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
              ready: (_) => Icons.close,
            ),
          ),
          onPressed: () => context.read<UsersBloc>().add(state.when(
              initial: () => const UsersEvent.init(),
              ready: (_) => const UsersEvent.reset())),
        ),
      ),
    );
  }
}
