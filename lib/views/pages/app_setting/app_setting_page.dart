import 'package:architech_drone_control_app/controllers/app_controller.dart';
import 'package:architech_drone_control_app/utils/helpers/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSettingPage extends StatelessWidget {
  const AppSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppController appController = Get.find<AppController>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton.outlined(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const Text('App Setting'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => UiHelper.showToast(
                UiType.info,
                message: 'No update!',
                discardPrevious: true,
              ),
              child: ListTile(
                title: const Text('Current Version'),
                trailing: Text(appController.version),
              ),
            )
          ],
        ),
      ),
    );
  }
}
