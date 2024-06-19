import 'package:architech_drone_control_app/controllers/app_controller.dart';
import 'package:architech_drone_control_app/controllers/drone_controller.dart';
import 'package:architech_drone_control_app/models/app/app_styles.dart';
import 'package:architech_drone_control_app/models/enums/steaming_interface.dart';
import 'package:architech_drone_control_app/utils/helpers/ui_helper.dart';
import 'package:architech_drone_control_app/views/pages/control/components/control_setting_panel.dart';
import 'package:architech_drone_control_app/views/pages/control/components/debug/debug_panel.dart';
import 'package:architech_drone_control_app/views/pages/control/components/joystick_wrapper.dart';
import 'package:architech_drone_control_app/views/pages/control/components/socket/state_state_row.dart';
import 'package:architech_drone_control_app/views/pages/control/control_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:media_kit_video/media_kit_video.dart';

class ControlPage extends StatelessWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ControlPageController pageController =
        Get.put(ControlPageController());
    final AppController appController = Get.find<AppController>();
    final DroneController droneController = Get.find<DroneController>();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black87,
            child: Center(
              child: Video(
                controller: droneController.streamingController,
                controls: NoVideoControls,
              ),
            ),
          ),
          Positioned(
            left: 16.0,
            top: MediaQuery.of(context).padding.top + 16.0,
            child: IconButton(
              onPressed: () {
                droneController.disconnectDrone();
                Get.back(closeOverlays: true);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16.0,
            right: 16.0,
            child: Row(
              children: [
                Obx(
                  () => ElevatedButton(
                    onPressed: droneController.isOperator.value ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100.0, 48.0),
                      backgroundColor: AppColors.error,
                    ),
                    child: const Text('E-Stop'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Container(
                  height: 48.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        Obx(() => SocketStateRow(
                              state: droneController.socketState.value,
                            )),
                        const SizedBox(width: 16.0),
                        PopupMenuButton(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context) => <PopupMenuEntry>[
                            PopupMenuItem(
                              onTap: () => UiHelper.showDialog(
                                  child: const ControlSettingPanel()),
                              child: const Text('Setting'),
                            ),
                            if (appController.isEnvDev) ...[
                              const PopupMenuDivider(),
                              PopupMenuItem(
                                onTap: () => appController.debugMode.value =
                                    !appController.debugMode.value,
                                child: const Text('Toggle Debug Mode'),
                              ),
                            ]
                          ],
                          icon: const Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: MediaQuery.of(context).padding.bottom + 24.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                PopupMenuButton(
                  itemBuilder: (context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      onTap: () => droneController
                          .changeStreamingInterface(StreamingInterface.color),
                      child: const Text('Color'),
                    ),
                    PopupMenuItem(
                      onTap: () => droneController
                          .changeStreamingInterface(StreamingInterface.depth),
                      child: const Text('Depth'),
                    ),
                  ],
                  icon: const Icon(Icons.video_camera_back_rounded),
                )
              ],
            ),
          ),
          // TODO: Seperate JoystickWrapper into two compoents
          Positioned(
            left: 16.0,
            bottom: MediaQuery.of(context).padding.bottom + 48.0,
            right: 16.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => JoystickWrapper(
                      isEnabled: droneController.isOperator.value,
                      baseRadius: pageController.joystickBaseRadius.value,
                      stickRadius: pageController.joystickStickRadius.value,
                      onMove: (details) => droneController.movement(
                        linearX: details.x,
                        linearY: details.y,
                      ),
                    )),
                Obx(() => JoystickWrapper(
                      isEnabled: droneController.isOperator.value,
                      baseRadius: pageController.joystickBaseRadius.value,
                      stickRadius: pageController.joystickStickRadius.value,
                      onMove: (details) => droneController.movement(
                        angularX: details.y,
                        angularZ: details.x,
                      ),
                    )),
              ],
            ),
          ),
          // Debug
          const DebugPanel(),
        ],
      ),
    );
  }
}
