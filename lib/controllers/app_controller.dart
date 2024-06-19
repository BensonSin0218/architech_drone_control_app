import 'package:architech_drone_control_app/models/app/app_env.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppController extends GetxController {
  final Rx<String> env = (const String.fromEnvironment("ENV")).obs;
  final Rx<bool> debugMode = false.obs;

  final Rx<String> _version = ''.obs;
  final Rx<String> _buildNumber = ''.obs;

  @override
  void onInit() async {
    super.onInit();

    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _version.value = packageInfo.version;
    _buildNumber.value = packageInfo.buildNumber;
  }

  bool get isEnvDev => env.value == AppEnv.dev.name;

  String get version =>
      'v${_version.value}+${_buildNumber.value}${isEnvDev ? 'D' : ''}';
}
