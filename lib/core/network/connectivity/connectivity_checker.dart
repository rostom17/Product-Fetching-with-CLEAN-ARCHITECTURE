import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityChecker {
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    }

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    }

    if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    }

    if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    }

    if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
      return true;
    }

    if (connectivityResult.contains(ConnectivityResult.vpn) ||
        connectivityResult.contains(ConnectivityResult.other)) {
      true;
    }

    return false;
  }
}
