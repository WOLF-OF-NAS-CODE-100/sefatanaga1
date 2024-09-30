import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  var isDarkMode;

  ThemeData get themeData {
    return _isDarkTheme ? ThemeData.dark() : ThemeData.light();
  }

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
