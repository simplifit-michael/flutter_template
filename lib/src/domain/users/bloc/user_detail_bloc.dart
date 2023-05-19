import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/cubit/app_state_bloc.dart';
import 'package:flutter_template/src/domain/app_state/entity/error_feedback.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../export.dart';
import '../../../core/errors/failures/failure.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final UsersRepository _repo;
  final AppStateCubit _app;
  UserDetailBloc(this._repo, this._app) : super(const _Initial()) {
    on<UserDetailEvent>((event, emit) async {
      await event.map(init: (value) => _init(emit, value));
    });
  }

  Future<void> _init(Emitter<UserDetailState> emit, _Init event) async {
    final id = event.id;
    if (id == null) {
      _app.add(AppStateEvent.setError(error: ErrorFeedbackBuilder.fromFailure(FailureType.invalidDataSent)));
      return;
    }

    final result = await _repo.getUser(id);
    result.fold((failureType) {
      _app.add(AppStateEvent.setError(error: ErrorFeedbackBuilder.fromFailure(failureType)));
    }, (user) {
      emit(UserDetailState.ready(user));
    });
  }
}
