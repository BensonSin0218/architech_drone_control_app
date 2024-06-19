import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class NetworkController extends GetxController {
  late NetworkInfo? _networkInfo;

  Future<void> initNetworkService() async {
    if (await Permission.location.request().isGranted) {
      print('Location permission granted');

      _networkInfo = NetworkInfo();
    } else {
      print('Location permission denied');

      _networkInfo = null;
    }
  }

  Future<String?> getWiFiName() async {
    if (await Permission.location.isDenied) {
      return null;
    }

    try {
      return await _networkInfo?.getWifiName() ?? '';
    } catch (error) {
      print('Error: $error');

      return null;
    }
  }

  Future<String?> getWiFiIP() async {
    if (await Permission.location.isDenied) {
      return null;
    }

    try {
      return await _networkInfo?.getWifiIP() ?? '';
    } catch (error) {
      print('Error: $error');

      return null;
    }
  }
}
