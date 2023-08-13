import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  NetworkService(this._connectivity);

  final Connectivity _connectivity;

  Future<bool> get hasConnection async => //
      (await _connectivity.checkConnectivity()) != ConnectivityResult.none;
}
