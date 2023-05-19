part of 'app_state_bloc.dart';

@freezed
class AppStateEvent with _$AppStateEvent {
  const factory AppStateEvent.reset() = _Reset;
  const factory AppStateEvent.setLoading() = _SetLoading;
  const factory AppStateEvent.setInfo({required InfoFeedback info, Map<String, dynamic>? namedArgs}) = _SetInfo;
  const factory AppStateEvent.setError({
    ErrorFeedback? error,
    Map<String, dynamic>? namedArgs,
    FutureOr<void> Function()? onConfirm,
  }) = _SetError;
}
