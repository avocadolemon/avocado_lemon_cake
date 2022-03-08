import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    fontFamily: 'OpenSans',
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  );

  static final lightTheme = ThemeData(
    fontFamily: 'OpenSans',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
  );
}
