part of 'connection_monitor_cubit.dart';

@freezed
class ConnectionMonitorState with _$ConnectionMonitorState {
  const factory ConnectionMonitorState.noInternet() = _NoInternetState;
  const factory ConnectionMonitorState.ready() = _ReadyState;
}
