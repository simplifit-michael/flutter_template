import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/domain/app_state/entity/error_feedback.dart';
import 'package:flutter_template/src/domain/app_state/entity/info_feedback.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state_state.dart';
part 'app_state_event.dart';
part 'app_state_bloc.freezed.dart';

class AppStateCubit extends Bloc<AppStateEvent, AppStateState> {
  AppStateCubit() : super(const AppStateState.ready()) {
    on<AppStateEvent>((event, emit) async {
      event.map(
        reset: (event) => _reset(event, emit),
        setLoading: (event) => _setLoading(event, emit),
        setInfo: (event) => _setInfo(event, emit),
        setError: (event) => _setError(event, emit),
      );
    });
  }

  void _reset(_Reset event, Emitter<AppStateState> emit) => emit(const AppStateState.ready());
  void _setLoading(_SetLoading event, Emitter<AppStateState> emit) => emit(const AppStateState.loading());
  void _setInfo(_SetInfo event, Emitter<AppStateState> emit) {
    emit(
      AppStateState.info(
        info: event.info,
        namedArgs: event.namedArgs,
      ),
    );
    emit(const AppStateState.ready());
  }

  void _setError(_SetError event, Emitter<AppStateState> emit) {
    emit(
      AppStateState.error(
        error: event.error,
        namedArgs: event.namedArgs,
        onConfirm: event.onConfirm,
      ),
    );
    emit(const AppStateState.ready());
  }
}
