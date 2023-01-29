part of 'users_bloc.dart';

@freezed
class UsersEvent with _$UsersEvent {
  const factory UsersEvent.init() = _Init;
  const factory UsersEvent.refresh() = _Refresh;
  const factory UsersEvent.reset() = _Reset;
}
