import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkManager {
  static const String networkErrorMsg = "Unable to connect. Please check your internet connection";

  static Future<bool> isNetworkConnected() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}