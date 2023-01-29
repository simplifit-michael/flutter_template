part of 'users_bloc.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.ready(List<User> users) = _Ready;
  const factory UsersState.error(FailureType failureType) = _Error;
}
