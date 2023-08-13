import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/shared/service/export.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_monitor_state.dart';
part 'connection_monitor_cubit.freezed.dart';

class ConnectionMonitorCubit extends Cubit<ConnectionMonitorState> {
  ConnectionMonitorCubit(NetworkService network)
      : super(const ConnectionMonitorState.noInternet()) {
    network.hasConnectionStream.listen((event) {
      if (event) {
        emit(const ConnectionMonitorState.ready());
      } else {
        emit(const ConnectionMonitorState.noInternet());
      }
    });
    network.checkConnection();
  }
}
