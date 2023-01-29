// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

import '../export.dart';
import '../../../core/errors/failures/failure.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final _logger = Logger('$UsersBloc');
  final UsersRepository _repo;

  UsersBloc({required UsersRepository repo})
      : _repo = repo,
        super(const _Initial()) {
    on<UsersEvent>((event, emit) {
      event.map(
        init: _init,
        reset: _reset,
      );
    });
  }

  Future<void> _init(_Init event) async {
    _logger.info('Requesting Users');
    final result = await _repo.getUsers();
    result.fold(
      (failureType) {
        _logger.warning('Error during user request: ${failureType.name}');
        emit(UsersState.error(failureType));
      },
      (users) {
        _logger.info('Emitting Ready State with ${users.length} users');
        emit(UsersState.ready(users));
      },
    );
  }

  Future<void> _reset(_Reset value) async {
    _logger.info('Resetted State back to Initial');
    emit(const UsersState.initial());
  }
}
