import 'package:architech_drone_control_app/controllers/app_controller.dart';
import 'package:architech_drone_control_app/models/app/app_images.dart';
import 'package:architech_drone_control_app/views/components/app/app_linear_progress_indicator.dart';
import 'package:architech_drone_control_app/views/pages/splash/splash_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashPageController pageController = Get.put(SplashPageController());
    final AppController appController = Get.find<AppController>();

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              AppImages.appIcon.path,
              width: size.width * 0.4,
              height: size.height * 0.4,
            ),
          ),
          Positioned(
              left: 0.0,
              right: 0.0,
              bottom: MediaQuery.of(context).padding.bottom + 32.0,
              child: Column(children: [
                Obx(
                  () => AppProgressIndicator(
                    value: pageController.progressValue.value,
                    displayText: pageController.progressValue.value != 1.0
                        ? 'Loading...'
                        : 'Finished!',
                    progressIndicatorWidth: size.width * 0.75,
                  ),
                ),
                const SizedBox(height: 8.0),
                Obx(
                  () => Text(appController.version),
                )
              ]))
        ],
      ),
    );
  }
}
