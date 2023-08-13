part of 'app_state_cubit.dart';

@freezed
class AppStateState with _$AppStateState {
  const factory AppStateState.ready() = _AppReadyState;

  const factory AppStateState.loading({
    LoadingReason? reason,
  }) = _AppLoadingState;

  const factory AppStateState.error({
    ErrorReason? reason,
    VoidCallback? onConfirm,
  }) = _AppErrorState;

  const factory AppStateState.info({
    required InfoReason reason,
    required VoidCallback? onConfirm,
  }) = _AppInfoState;
}
