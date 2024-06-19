import 'package:flutter/material.dart';

class AppColors {
  static const Color disabled = Colors.grey;
  static const Color warning = Colors.yellow;
  static const Color success = Colors.green;
  static const Color error = Colors.red;
}

class AppThemes {
  static ThemeData light = ThemeData(
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.blueAccent,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
      error: AppColors.error,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledForegroundColor: Colors.grey.shade300,
        disabledBackgroundColor: Colors.grey,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    ),
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll<Size>(Size(32.0, 32.0)),
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.white),
        elevation: WidgetStatePropertyAll<double>(3.0),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 24.0,
    ),
  );

  // TODO: Implement dark theme
  static ThemeData dark = ThemeData();
}
