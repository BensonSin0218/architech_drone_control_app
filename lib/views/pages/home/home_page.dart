import 'package:architech_drone_control_app/controllers/drone_controller.dart';
import 'package:architech_drone_control_app/controllers/network_controller.dart';
import 'package:architech_drone_control_app/models/app/app_images.dart';
import 'package:architech_drone_control_app/routes/app_pages.dart';
import 'package:architech_drone_control_app/utils/formatters/ip_address_input_formatter.dart';
import 'package:architech_drone_control_app/utils/helpers/ui_helper.dart';
import 'package:architech_drone_control_app/utils/helpers/validation_helper.dart';
import 'package:architech_drone_control_app/views/pages/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePageController pageController = Get.put(HomePageController());
    final NetworkController networkController = Get.find<NetworkController>();
    final DroneController droneController = Get.put(DroneController());

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Row(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                AppImages.appIcon.path,
                width: size.width * 0.5,
                height: size.height * 0.5,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * 0.25, 0.0),
                  ),
                  onPressed: () async => UiHelper.showDialog(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Connect to drone',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                              'Your IP Address: ${await networkController.getWiFiIP()}'),
                          Obx(
                            () => TextField(
                              controller: pageController
                                  .droneIpAddressTextEditingController.value,
                              decoration: const InputDecoration(
                                labelText: 'IP Address',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) =>
                                  pageController.droneIpAddress.value = value,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9.]')),
                                LengthLimitingTextInputFormatter(15),
                                IpAddressInputFormatter(),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Obx(
                            () => pageController
                                    .lastDroneIpAddress.value.isNotEmpty
                                ? Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Text('Use Last IP Address: '),
                                          Obx(
                                            () => GestureDetector(
                                              onTap: () => pageController
                                                  .updateDroneIpAddress(
                                                      pageController
                                                          .lastDroneIpAddress
                                                          .value),
                                              child: Text(
                                                pageController
                                                    .lastDroneIpAddress.value,
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 16.0)
                                    ],
                                  )
                                : const SizedBox.shrink(),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () =>
                                      Get.back(closeOverlays: true),
                                  child: const Text('Cancel'),
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (!ValidationHelper.isIpAddress(
                                        pageController.droneIpAddress.value)) {
                                      UiHelper.showSnackbar(
                                        UiType.error,
                                        message: 'Invalid IP address format',
                                      );
                                      return;
                                    }

                                    Get.back(
                                        closeOverlays: true); // Close dialog

                                    droneController.connectDrone(
                                        pageController.droneIpAddress.value);
                                    pageController.setLastDroneIpAddress(
                                        pageController.droneIpAddress.value);

                                    Get.toNamed(AppRoutes.control.path);
                                  },
                                  child: const Text('Connect'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  child: const Text('Control'),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(size.width * 0.25, 0.0),
                  ),
                  onPressed: null, // TODO: Navigate to file page
                  child: const Text('Files'),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton.outlined(
        onPressed: () => Get.toNamed(AppRoutes.settingsApp.path),
        icon: const Icon(Icons.settings),
      ),
    );
  }
}
