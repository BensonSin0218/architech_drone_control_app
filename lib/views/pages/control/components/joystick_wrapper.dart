import 'package:architech_drone_control_app/models/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class JoystickWrapper extends StatelessWidget {
  const JoystickWrapper({
    required this.isEnabled,
    this.baseRadius = 100.0,
    this.stickRadius = 25.0,
    this.mode = JoystickMode.all,
    required this.onMove,
    super.key,
  });

  final bool isEnabled;
  final double baseRadius;
  final double stickRadius;
  final JoystickMode mode;
  final Function(StickDragDetails) onMove;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !isEnabled,
      child: Joystick(
        listener: (detail) => onMove(detail),
        includeInitialAnimation: false,
        mode: mode,
        base: Container(
          width: baseRadius * 2,
          height: baseRadius * 2,
          decoration: BoxDecoration(
            color: Colors.grey.shade300.withOpacity(0.75),
            shape: BoxShape.circle,
          ),
          child: const Stack(
            children: [
              Positioned(
                left: 8.0,
                top: 0.0,
                bottom: 0.0,
                child: Icon(Icons.keyboard_arrow_left),
              ),
              Positioned(
                left: 0.0,
                top: 8.0,
                right: 0.0,
                child: Icon(Icons.keyboard_arrow_up),
              ),
              Positioned(
                top: 0.0,
                right: 8.0,
                bottom: 0.0,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 8.0,
                child: Icon(Icons.keyboard_arrow_down),
              )
            ],
          ),
        ),
        stick: Container(
          width: stickRadius * 2,
          height: stickRadius * 2,
          decoration: BoxDecoration(
            color:
                isEnabled ? Theme.of(context).primaryColor : AppColors.disabled,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
