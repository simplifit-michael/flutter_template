part of 'user_detail_bloc.dart';

@freezed
class UserDetailState with _$UserDetailState {
  const factory UserDetailState.initial() = _Initial;
  const factory UserDetailState.error() = _Error;
  const factory UserDetailState.ready(User user) = _Ready;
}
