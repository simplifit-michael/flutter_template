import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/src/presentation/app_state/user_feedback/error_feedback.dart';
import 'package:flutter_template/src/presentation/app_state/user_feedback/info_feedback.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state_state.dart';
part 'app_state_cubit.freezed.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit() : super(const AppStateState.ready());

  void reset() => emit(const AppStateState.ready());
  void setLoading() => emit(const AppStateState.loading());
  void setInfo({required InfoFeedback info, Map<String, dynamic>? namedArgs}) => emit(
        AppStateState.info(
          info: info,
          namedArgs: namedArgs,
        ),
      );

  void setError({
    ErrorFeedback? error,
    Map<String, dynamic>? namedArgs,
    FutureOr<void> Function()? onConfirm,
  }) =>
      emit(
        AppStateState.error(
          error: error,
          namedArgs: namedArgs,
          onConfirm: onConfirm,
        ),
      );
}
