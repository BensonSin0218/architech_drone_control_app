import 'dart:ui';

import 'package:architech_drone_control_app/models/app/app_styles.dart';

enum SocketState {
  disconnected(color: AppColors.error),
  connecting(color: AppColors.warning),
  connected(color: AppColors.success);

  const SocketState({
    required this.color,
  });

  final Color color;
}
