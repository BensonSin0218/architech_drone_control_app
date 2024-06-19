import 'package:architech_drone_control_app/models/app/app_storage.dart';
import 'package:architech_drone_control_app/views/pages/control/control_page_setting.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ControlPageController extends GetxController {
  GetStorage storage = GetStorage();

  final Rx<double> joystickBaseRadius =
      ControlPageSetting.defaultJoystickBaseRadius.obs;
  final Rx<double> joystickStickRadius =
      ControlPageSetting.defaultJoystickStickRadius.obs;

  @override
  void onInit() {
    joystickBaseRadius.value =
        storage.read(AppStorage.joystickBaseRadius.key) ??
            ControlPageSetting.defaultJoystickBaseRadius;
    joystickStickRadius.value =
        storage.read(AppStorage.joystickStickRadius.key) ??
            ControlPageSetting.defaultJoystickStickRadius;

    super.onInit();
  }

  void setJoystickBaseRadius(double value) {
    joystickBaseRadius.value = value;
    storage.write(AppStorage.joystickBaseRadius.key, value);
  }

  void setJoystickStickRadius(double value) {
    joystickStickRadius.value = value;
    storage.write(AppStorage.joystickStickRadius.key, value);
  }
}
