import 'package:flutter/material.dart';

class DarkTheme {
  final _darkColor = _DarkColor();

  late ThemeData theme;

  DarkTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)))),
        scaffoldBackgroundColor: Colors.grey.withOpacity(0.9),

        cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),

        colorScheme: const ColorScheme.dark(),

        textTheme:
        ThemeData.dark().textTheme.copyWith(subtitle1: TextStyle(fontSize: 20, color: _darkColor._textColor)));
  }
}

class _DarkColor {
  final Color _textColor = const Color.fromARGB(255, 255, 255, 255);
  final Color blueMenia = const Color.fromARGB(95, 188, 248, 1);
}