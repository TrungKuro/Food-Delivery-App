import 'package:flutter/material.dart';
import 'package:food_delivery_app/themes/dart_mode.dart';
import 'package:food_delivery_app/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier {
  /* ------------------------------- PRIVATE ------------------------------- */

  // Chủ đề mặc định khi khởi động ứng dụng là "Light Mode"
  ThemeData _themeData = lightMode;

  /* -------------------------------- GETTER ------------------------------- */

  // Cho biết chủ đề hiện tại của ứng dụng
  ThemeData get themeData => _themeData;

  // Cho biết chủ đề hiện tại của ứng dụng là "Dark Mode" hay ko?
  bool get isDarkMode => _themeData == darktMode;

  /* -------------------------------- SETTER ------------------------------- */

  // Cài đặt chủ đề cho ứng dụng
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    // Cập nhập UI
    notifyListeners();
  }

  // Đảo chủ đề hiện tại của ứng dụng
  void toggleTheme() {
    isDarkMode ? _themeData = lightMode : _themeData = darktMode;
    // Cập nhập UI
    notifyListeners();
  }
}
