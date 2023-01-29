// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

import '../export.dart';
import '../../../core/errors/failures/failure.dart';

part 'user_detail_event.dart';
part 'user_detail_state.dart';
part 'user_detail_bloc.freezed.dart';

class UserDetailBloc extends Bloc<UserDetailEvent, UserDetailState> {
  final _logger = Logger('$UserDetailBloc');
  final UsersRepository _repo;
  UserDetailBloc(this._repo) : super(const _Initial()) {
    on<UserDetailEvent>((event, emit) {
      event.map(
        init: _init,
      );
    });
  }

  Future<void> _init(_Init event) async {
    final id = event.id;
    if (id == null) {
      _logger.warning('Id is null');
      emit(const UserDetailState.error(FailureType.badRequest));
      return;
    }

    _logger.info('Requesting User $id');
    final result = await _repo.getUser(id);
    result.fold((failureType) {
      _logger.warning('Error during user request: ${failureType.name}');
      emit(UserDetailState.error(failureType));
    }, (user) {
      _logger.info('Emitting Ready State with user $id');
      emit(UserDetailState.ready(user));
    });
  }
}
