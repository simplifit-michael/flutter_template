import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state_state.dart';
part 'app_state_cubit.freezed.dart';

class AppStateCubit extends Cubit<AppStateState> {
  AppStateCubit() : super(const AppStateState.ready());

  void reset() => emit(const AppStateState.ready());
  void setLoading() => emit(const AppStateState.loading());
  void setInfo({
    required String captionKey,
    required String buttonKey,
    required String messageKey,
    Map<String, String>? namedArgs,
  }) =>
      emit(
        AppStateState.info(
          captionKey: captionKey,
          messageKey: messageKey,
          namedArgs: namedArgs,
          buttonKey: buttonKey,
        ),
      );

  void setError({
    required String captionKey,
    required String buttonKey,
    required String messageKey,
    Map<String, String>? namedArgs,
  }) =>
      emit(
        AppStateState.error(
          captionKey: captionKey,
          messageKey: messageKey,
          namedArgs: namedArgs,
          buttonKey: buttonKey,
        ),
      );
}
