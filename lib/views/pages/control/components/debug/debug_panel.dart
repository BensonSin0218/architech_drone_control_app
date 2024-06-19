import 'package:architech_drone_control_app/controllers/app_controller.dart';
import 'package:architech_drone_control_app/controllers/drone_controller.dart';
import 'package:architech_drone_control_app/views/pages/control/components/debug/debug_panel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebugPanel extends StatelessWidget {
  const DebugPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final DebugPanelController controller = Get.put(DebugPanelController());
    final AppController appController = Get.find<AppController>();
    final DroneController droneController = Get.find<DroneController>();

    const Widget icon = Icon(Icons.adb);

    return Obx(
      () => Positioned(
          left: controller.panelToLeftPosition.value,
          top: controller.panelToTopPosition.value,
          child: Obx(
            () => appController.debugMode.value
                ? !controller.isPanelOpen.value
                    ? Draggable(
                        onDragStarted: () => controller.isDragging.value = true,
                        onDragEnd: (details) {
                          controller.updatePanelPosition(
                              details.offset.dx, details.offset.dy);

                          controller.isDragging.value = false;
                        },
                        feedback: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: icon,
                        ),
                        child: !controller.isDragging.value
                            ? IconButton(
                                onPressed: () =>
                                    controller.isPanelOpen.value = true,
                                icon: icon,
                              )
                            : const SizedBox.shrink(),
                      )
                    : GestureDetector(
                        onDoubleTap: () => controller.isPanelOpen.value = false,
                        child: IntrinsicHeight(
                          child: Container(
                            width: 200.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Movement',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                const SizedBox(height: 8.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Twist.linear'),
                                    const SizedBox(width: 8.0),
                                    Obx(() => Text(
                                          droneController.twist.value.linear.x
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Obx(() => Text(
                                          droneController.twist.value.linear.y
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Obx(() => Text(
                                          droneController.twist.value.linear.z
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 4.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Twist.angular'),
                                    const SizedBox(width: 8.0),
                                    Obx(() => Text(
                                          droneController.twist.value.angular.x
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Obx(() => Text(
                                          droneController.twist.value.angular.y
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    Obx(() => Text(
                                          droneController.twist.value.angular.z
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                : const SizedBox.shrink(),
          )),
    );
  }
}
