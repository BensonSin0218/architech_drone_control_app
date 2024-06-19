import 'package:architech_drone_control_app/views/components/app/app_slider.dart';
import 'package:architech_drone_control_app/views/pages/control/control_page_controller.dart';
import 'package:architech_drone_control_app/views/pages/control/control_page_setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlSettingPanel extends StatelessWidget {
  const ControlSettingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final ControlPageController pageController =
        Get.find<ControlPageController>();

    return Column(
      children: [
        Text('Control Setting', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 32.0),
        Column(
          children: [
            Text(
              'Joystick Size',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const SizedBox(width: 96.0, child: Text('Base Radius')),
                Expanded(
                  child: Obx(
                    () => AppSlider(
                      value: pageController.joystickBaseRadius.value,
                      min: !context.isPhone
                          ? ControlPageSetting.minJoystickBaseRadius
                          : ControlPageSetting.minJoystickBaseRadiusForMobile,
                      max: !context.isPhone
                          ? ControlPageSetting.maxJoystickBaseRadius
                          : ControlPageSetting.maxJoystickBaseRadiusForMobile,
                      divisions: ((ControlPageSetting.maxJoystickBaseRadius -
                                  ControlPageSetting.minJoystickBaseRadius) /
                              5)
                          .toInt(),
                      onChanged: (value) =>
                          pageController.setJoystickBaseRadius(value),
                      displayValue:
                          '${pageController.joystickBaseRadius.value}',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const SizedBox(width: 96.0, child: Text('Stick Radius')),
                Expanded(
                  child: Obx(
                    () => AppSlider(
                      value: pageController.joystickStickRadius.value,
                      min: !context.isPhone
                          ? ControlPageSetting.minJoystickStickRadius
                          : ControlPageSetting.minJoystickStickRadiusForMobile,
                      max: !context.isPhone
                          ? ControlPageSetting.maxJoystickStickRadius
                          : ControlPageSetting.maxJoystickStickRadiusForMobile,
                      divisions: ((ControlPageSetting.maxJoystickStickRadius -
                                  ControlPageSetting.minJoystickStickRadius) /
                              5)
                          .toInt(),
                      onChanged: (value) =>
                          pageController.setJoystickStickRadius(value),
                      displayValue:
                          '${pageController.joystickStickRadius.value}',
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
