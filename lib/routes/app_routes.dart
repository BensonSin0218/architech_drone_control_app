part of 'app_pages.dart';

enum AppRoutes {
  splash(path: '/splash'),
  home(path: '/home'),
  control(path: '/control'),
  settingsApp(path: '/settings/app'),
  notFound(path: '/notFound');

  const AppRoutes({required this.path});

  final String path;
}
