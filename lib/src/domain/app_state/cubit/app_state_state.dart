part of 'app_state_bloc.dart';

@freezed
class AppStateState with _$AppStateState {
  const factory AppStateState.ready() = _Ready;
  const factory AppStateState.loading() = _Loading;
  const factory AppStateState.info({
    required InfoFeedback info,
    Map<String, dynamic>? namedArgs,
  }) = _Info;
  const factory AppStateState.error({
    ErrorFeedback? error,
    Map<String, dynamic>? namedArgs,
    FutureOr<void> Function()? onConfirm,
  }) = _Error;
}
