import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/app_state/entity/error_feedback.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../export.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository _repo;
  final AppStateCubit _app;

  UsersBloc({required UsersRepository repo, required AppStateCubit app})
      : _repo = repo,
        _app = app,
        super(const _Initial()) {
    on<UsersEvent>((event, emit) async {
      await event.map(
        init: (value) => _init(emit, value),
        refresh: (value) => _refresh(emit, value),
        reset: (value) => _reset(emit, value),
      );
    });
  }

  Future<void> _init(Emitter<UsersState> emit, _Init event) async {
    emit(const UsersState.loading());
    final result = await _repo.getUsers();
    result.fold(
      (failureType) {
        _app.add(AppStateEvent.setError(error: ErrorFeedbackBuilder.fromFailure(failureType)));
      },
      (users) {
        emit(UsersState.ready(users));
      },
    );
  }

  Future<void> _reset(Emitter<UsersState> emit, _Reset event) async {
    await _repo.clear();
    emit(const UsersState.initial());
  }

  Future<void> _refresh(Emitter<UsersState> emit, _Refresh event) async {
    emit(const UsersState.loading());
    final result = await _repo.getUsers(force: true);
    result.fold(
      (failureType) {
        _app.add(AppStateEvent.setError(error: ErrorFeedbackBuilder.fromFailure(failureType)));
      },
      (users) {
        emit(UsersState.ready(users));
      },
    );
  }
}
