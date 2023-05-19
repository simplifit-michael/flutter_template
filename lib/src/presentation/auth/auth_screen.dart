import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/core/app/export.dart';
import 'package:flutter_template/src/domain/auth/bloc/auth_bloc.dart';
import 'package:flutter_template/src/presentation/app_state/app_state_handler.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  static const path = '/auth';

  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateHandler(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            loggedIn: (_) => context.go(MainScreen.path),
          );
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('AuthScreen'),
                ElevatedButton(
                  onPressed: () => context.read<AuthBloc>().add(const AuthEvent.signIn('email', 'password')),
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
