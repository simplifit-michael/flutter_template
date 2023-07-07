part of 'app_state_cubit.dart';

@freezed
class AppStateState with _$AppStateState {
  const factory AppStateState.ready() = _Ready;
  const factory AppStateState.loading() = _Loading;
  const factory AppStateState.info({
    required String captionKey,
    required String messageKey,
    required String buttonKey,
    Map<String, String>? namedArgs,
  }) = _Info;
  const factory AppStateState.error({
    required String captionKey,
    required String messageKey,
    required String buttonKey,
    Map<String, String>? namedArgs,
  }) = _Error;
}

extension AppStateStateExtension on AppStateState {
  bool get isLoading => map(
        ready: (_) => false,
        loading: (_) => true,
        info: (_) => false,
        error: (_) => false,
      );
}
