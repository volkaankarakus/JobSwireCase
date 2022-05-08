import 'package:flutter/material.dart';
import 'package:jobswire_case/product/global/dark_theme.dart';
import 'package:jobswire_case/product/global/light_theme.dart';

class ThemeNotifier extends ChangeNotifier{
  bool isLightTheme = true;

  void changeTheme(){
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => isLightTheme ? LightTheme().theme : DarkTheme().theme;
}