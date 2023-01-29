import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService{
  final Connectivity _connectivity;

  NetworkService(this._connectivity);

  Future<bool> get hasConnection async => (await _connectivity.checkConnectivity()) != ConnectivityResult.none;

}