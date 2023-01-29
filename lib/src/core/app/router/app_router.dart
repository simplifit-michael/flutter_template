import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/users/export.dart';
import '../../service/export.dart';
import '../export.dart';

class AppRouter extends GoRouter {
  AppRouter()
      : super(
          routes: _buildRoutes(),
          redirect: _buildRedirect,
          initialLocation: '/',
        );

  static FutureOr<String?> _buildRedirect(
    BuildContext context,
    GoRouterState state,
  ) {
    if (state.location == '/') {
      return MainScreen.path; //TODO: Add MainScreen here
    }
    return null;
  }

  static List<GoRoute> _buildRoutes() => [
        GoRoute(
          path: '/',
          redirect: (context, state) => MainScreen.path,
        ),
        GoRoute(
            path: MainScreen.path,
            builder: (context, state) => const MainScreen(),
            routes: [
              GoRoute(
                path: '${UserDetailScreen.path}/:id',
                builder: (context, state) {
                  final id = state.params['id'];
                  return BlocProvider(
                    create: (context) =>
                        UserDetailBloc(locator<UsersRepository>())
                          ..add(UserDetailEvent.init(id)),
                    child: const UserDetailScreen(),
                  );
                },
              )
            ])
      ];
}
