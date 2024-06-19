part of 'package:architech_drone_control_app/utils/helpers/ui_helper.dart';

enum UiType {
  info(
    title: 'Info',
    icon: Icon(Icons.info_rounded),
    color: Colors.black,
  ),
  warning(
    title: 'Warning',
    icon: Icon(
      Icons.warning_rounded,
      color: AppColors.warning,
    ),
    color: AppColors.warning,
  ),
  success(
    title: 'Success',
    icon: Icon(
      Icons.check_circle_outline_rounded,
      color: AppColors.success,
    ),
    color: AppColors.success,
  ),
  error(
    title: 'Error',
    icon: Icon(
      Icons.error_rounded,
      color: AppColors.error,
    ),
    color: AppColors.error,
  ),
  ;

  const UiType({
    required this.title,
    required this.icon,
    required this.color,
  });

  final String title;
  final Icon icon;
  final Color color;
}
