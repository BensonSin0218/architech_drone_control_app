import 'package:architech_drone_control_app/controllers/app_controller.dart';
import 'package:architech_drone_control_app/controllers/network_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController(), permanent: true);
    Get.put(NetworkController(), permanent: true);
  }
}
