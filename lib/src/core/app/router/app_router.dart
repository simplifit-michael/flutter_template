import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/users/export.dart';
import '../../service/export.dart';
import '../export.dart';
import 'go_router_refresh_stream.dart';

class AppRouter extends GoRouter {
  AppRouter(AuthBloc auth)
      : super(
          refreshListenable: GoRouterRefreshStream(auth.stream),
          routes: _buildRoutes(),
          redirect: _buildRedirect,
          initialLocation: '/',
        );

  static FutureOr<String?> _buildRedirect(
    BuildContext context,
    GoRouterState state,
  ) {
    final authState = context.read<AuthBloc>().state;
    final authUser = authState.map(initial: (_) => null, loggedIn: (state) => state.user);
    final isLoggedIn = authUser != null;
    if (!isLoggedIn) {
      if (unrestrictedRoutes.contains(state.location)) {
        return null;
      }
      return AuthScreen.path;
    }

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
          path: AuthScreen.path,
          builder: (context, state) => const AuthScreen(),
        ),
        GoRoute(path: MainScreen.path, builder: (context, state) => const MainScreen(), routes: [
          GoRoute(
            path: '${UserDetailScreen.path}/:id',
            builder: (context, state) {
              final id = state.pathParameters['id'];
              return BlocProvider(
                create: (context) =>
                    UserDetailBloc(locator<UsersRepository>(), locator<AppStateCubit>())..add(UserDetailEvent.init(id)),
                child: const UserDetailScreen(),
              );
            },
          )
        ])
      ];
}
