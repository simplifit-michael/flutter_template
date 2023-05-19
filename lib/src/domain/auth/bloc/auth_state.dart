part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loggedIn(AuthUser user) = _LoggedIn;
}

extension AuthStateExtension on AuthState {
  bool get isLoggedIn => this is _LoggedIn;
}
