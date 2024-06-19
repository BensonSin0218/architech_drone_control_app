import 'dart:math';

import 'package:architech_drone_control_app/models/app/app_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DebugPanelController extends GetxController {
  static const defaultToLeftPosition = 56.0;
  static const defaultToTopPosition = 56.0;
  static const defaultPositionOffset = 64.0;

  GetStorage storage = GetStorage();

  final Rx<bool> isPanelOpen = false.obs;
  final Rx<double> panelToLeftPosition = defaultToLeftPosition.obs;
  final Rx<double> panelToTopPosition = defaultToTopPosition.obs;

  final Rx<bool> isDragging = false.obs;

  @override
  void onInit() {
    panelToLeftPosition.value =
        storage.read(AppStorage.debugPanelToLeftPosition.key) ??
            defaultToLeftPosition;
    panelToTopPosition.value =
        storage.read(AppStorage.debugPanelToTopPosition.key) ??
            defaultToTopPosition;

    super.onInit();
  }

  void updatePanelPosition(double left, double top) {
    if (Get.context?.mounted ?? false) {
      panelToLeftPosition.value = min(max(left, 0.0 + defaultPositionOffset),
          Get.context!.size!.width - defaultPositionOffset);
      panelToTopPosition.value = min(max(top, 0.0 + defaultPositionOffset),
          Get.context!.size!.height - defaultPositionOffset);

      storage.write(
          AppStorage.debugPanelToLeftPosition.key, panelToLeftPosition.value);
      storage.write(
          AppStorage.debugPanelToTopPosition.key, panelToTopPosition.value);
    }
  }
}
