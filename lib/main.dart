import 'package:architech_drone_control_app/bindings/app_binding.dart';
import 'package:architech_drone_control_app/models/app/app_styles.dart';
import 'package:architech_drone_control_app/routes/app_pages.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:media_kit/media_kit.dart';

class ArchiTechDroneControlApp extends StatelessWidget {
  const ArchiTechDroneControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      theme: AppThemes.light,
      defaultTransition: Transition.fadeIn,
      initialRoute: AppRoutes.splash.path,
      getPages: AppPages.pages,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);

  /// Plugin initialization
  await GetStorage.init();
  MediaKit.ensureInitialized();

  runApp(const ArchiTechDroneControlApp());
}
