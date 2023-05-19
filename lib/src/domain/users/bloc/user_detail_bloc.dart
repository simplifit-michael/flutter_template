import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../export.dart';
import '../../../core/errors/failures/failure.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UsersRepository _repo;
  UserDetailBloc(this._repo) : super(const _Initial()) {
    on<UserDetailEvent>((event, emit) {
      event.map(init: (value) => _init(emit, value));
    });
  }

  Future<void> _init(Emitter<UserDetailState> emit, _Init event) async {
    final id = event.id;
    if (id == null) {
      emit(const UserDetailState.error(FailureType.invalidDataSent));
      return;
    }

    final result = await _repo.getUser(id);
    result.fold((failureType) {
      emit(UserDetailState.error(failureType));
    }, (user) {
      emit(UserDetailState.ready(user));
    });
  }
}
