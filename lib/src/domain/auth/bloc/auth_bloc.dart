import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/app_state/entity/error_feedback.dart';
import 'package:flutter_template/src/domain/auth/repository/auth_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../entity/auth_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _repo;
  final AppStateCubit _app;

  AuthBloc(this._repo, this._app) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        init: (value) => _init(emit, value),
        signIn: (value) => _signIn(emit, value),
        signOut: (value) => _signOut(emit, value),
      );
    });
  }

  Future<void> _init(Emitter<AuthState> emit, _Init value) async {
    if (state is! _Initial) return;
    final user = await _repo.getCurrentUser();
    user.fold(
      (failure) => _app.add(AppStateEvent.setError(error: ErrorFeedbackBuilder.fromFailure(failure))),
      (user) => user != null ? emit(AuthState.loggedIn(user)) : null,
    );
  }

  Future<void> _signIn(Emitter<AuthState> emit, _SignIn value) async {
    if (state is! _Initial) return;
    final user = await _repo.signIn(value.email, value.password);
    user.fold(
      (failure) => _app.add(AppStateEvent.setError(error: ErrorFeedbackBuilder.fromFailure(failure))),
      (user) => emit(AuthState.loggedIn(user)),
    );
  }

  Future<void> _signOut(Emitter<AuthState> emit, _SignOut value) async {
    if (state is! _LoggedIn) return;
    final result = await _repo.signOut();
    result.fold(
      (failure) => _app.add(AppStateEvent.setError(error: ErrorFeedbackBuilder.fromFailure(failure))),
      (_) => emit(const AuthState.initial()),
    );
  }
}
