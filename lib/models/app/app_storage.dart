enum AppStorage {
  lastDroneIpAddress(key: 'lastDroneIpAddress'),
  joystickBaseRadius(key: 'joystick/baseRadius'),
  joystickStickRadius(key: 'joystick/stickRadius'),

  /// For debug
  debugPanelToLeftPosition(key: 'debugPanel/toLeftPosition'),
  debugPanelToTopPosition(key: 'debugPanel/toTopPosition');

  const AppStorage({
    required this.key,
  });

  final String key;
}
