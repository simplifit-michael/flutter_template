import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/error_reason.dart';
import '../model/info_reason.dart';
import '../model/loading_reason.dart';

part 'app_state_state.dart';
part 'app_state_cubit.freezed.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit() : super(const AppStateState.ready());

  void reset() => emit(const AppStateState.ready());

  void setLoading({LoadingReason? reason}) => //
      emit(AppStateState.loading(reason: reason));

  void setError({ErrorReason? reason, VoidCallback? onConfirm}) =>
      emit(AppStateState.error(reason: reason, onConfirm: onConfirm));

  void setInfo({required InfoReason reason, VoidCallback? onConfirm}) =>
      emit(AppStateState.info(reason: reason, onConfirm: onConfirm));
}
