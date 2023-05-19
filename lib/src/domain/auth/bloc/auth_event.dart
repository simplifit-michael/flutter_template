part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.init() = _Init;
  const factory AuthEvent.signIn(String email, String password) = _SignIn;
  const factory AuthEvent.signOut() = _SignOut;
}
