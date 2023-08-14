import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  NetworkService(this._connectivity);

  final Connectivity _connectivity;

  Stream<bool> get hasConnectionStream => _connectivity.onConnectivityChanged
      .map((event) => event != ConnectivityResult.none);

  Future<bool> get hasConnection async => //
      (await _connectivity.checkConnectivity()) != ConnectivityResult.none;

  void checkConnection() {
    _connectivity.checkConnectivity();
  }
}
