import 'package:architech_drone_control_app/models/app/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePageController extends GetxController {
  GetStorage storage = GetStorage();

  final Rx<TextEditingController> droneIpAddressTextEditingController =
      TextEditingController().obs;
  final Rx<String> droneIpAddress = ''.obs;
  final Rx<String> lastDroneIpAddress = ''.obs;

  @override
  void onInit() {
    lastDroneIpAddress.value =
        storage.read(AppStorage.lastDroneIpAddress.key) ?? '';

    super.onInit();
  }

  void updateDroneIpAddress(String value) {
    droneIpAddressTextEditingController.value.text = value;
    droneIpAddress.value = value;
  }

  void setLastDroneIpAddress(String value) {
    lastDroneIpAddress.value = value;
    storage.write(AppStorage.lastDroneIpAddress.key, value);
  }
}
