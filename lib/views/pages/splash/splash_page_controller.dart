import 'dart:developer';

import 'package:architech_drone_control_app/controllers/network_controller.dart';
import 'package:architech_drone_control_app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  final NetworkController networkController = Get.put(NetworkController());

  final Rx<double> progressValue = 0.0.obs;
  late List<Function> initFunctions = [
    () => Future.delayed(const Duration(seconds: 2)), // dummy function
    networkController.initNetworkService,
  ];

  @override
  void onInit() async {
    super.onInit();

    await _init();
  }

  Future<void> _init() async {
    for (final function in initFunctions) {
      try {
        print('Function: ${function.toString()}'); // Debug
        await function.call();
      } catch (error) {
        log('Error: $error');
      }

      progressValue.value += 1 / initFunctions.length;
    }

    if (progressValue.value == 1.0) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAllNamed(AppRoutes.home.path);
      });
    }
  }

  Future<void> retryInit() async => _init();
}
