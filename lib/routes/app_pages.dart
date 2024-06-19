import 'package:architech_drone_control_app/utils/extensions/page_extensions.dart';
import 'package:architech_drone_control_app/views/pages/app_setting/app_setting_page.dart';
import 'package:architech_drone_control_app/views/pages/control/control_page.dart';
import 'package:architech_drone_control_app/views/pages/home/home_page.dart';
import 'package:architech_drone_control_app/views/pages/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash.path,
      page: () => const SplashPage().blockBackPopScope(),
    ),
    GetPage(
      name: AppRoutes.home.path,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.settingsApp.path,
      page: () => const AppSettingPage(),
    ),
    GetPage(
        name: AppRoutes.control.path,
        page: () => const ControlPage().blockBackPopScope())
  ];
}
