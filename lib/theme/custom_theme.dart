import 'package:flutter/material.dart';

class CustomTheme extends ChangeNotifier {
  ThemeMode customMode = ThemeMode.dark;

  // Light Mode
  final _lightMode = ThemeData(
    // family font
    fontFamily: 'FugazOne',

    // Background
    scaffoldBackgroundColor: Colors.grey.shade300,

    listTileTheme: ListTileThemeData(textColor: Colors.black),
    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade300,
      foregroundColor: Colors.black,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
    ),

    // all text should be black
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
    ),

    // All Important color
    colorScheme: ColorScheme(
      brightness: Brightness.light,

      primary: Colors.grey.shade300,
      onPrimary: Colors.black,

      secondary: Colors.grey.shade500,
      onSecondary: Colors.black,

      tertiary: Colors.white,

      error: Colors.red,
      onError: Colors.red,

      onSurface: Colors.white,
      surface: Colors.white,
    ),
  );

  // dark mode
  final _darkMode = ThemeData(
    // family font
    fontFamily: 'FugazOne',

    // Background
    scaffoldBackgroundColor: Colors.grey.shade900,

    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      foregroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),

    // all text should be white
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),

    // All Important color
    colorScheme: ColorScheme(
      brightness: Brightness.dark,

      primary: Colors.grey.shade800,
      onPrimary: Colors.white,

      secondary: Colors.grey.shade600,
      onSecondary: Colors.white,

      tertiary: Colors.grey.shade900,

      error: Colors.red,
      onError: Colors.red,

      onSurface: Colors.white,
      surface: Colors.white,
    ),
  );

  ThemeData get customDarkMode => _darkMode;
  ThemeData get customLightMode => _lightMode;

  // change the mode
  void changeMode() {
    if (customMode == ThemeMode.dark) {
      customMode = ThemeMode.light;
    } else {
      customMode = ThemeMode.dark;
    }
    notifyListeners();
  }
}
