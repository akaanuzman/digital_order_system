import 'package:flutter/material.dart';

import '../color/my_colors.dart';

class MyTexts {
  static MyTexts? _instance;
  static MyTexts get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = MyTexts.init();
      return _instance!;
    }
  }

  MyTexts.init();

  MyColors get _colors => MyColors.instance;
  Color get _textColor => _colors.black;
  String get _fontFamily => 'Roboto';

  TextTheme get textTheme => TextTheme(
        //XX
        displayLarge: TextStyle(
          color: _textColor,
          fontSize: 64,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        displayMedium: TextStyle(
          //XX
          color: _textColor,
          fontSize: 52,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        displaySmall: TextStyle(
          //XX
          color: _textColor,
          fontSize: 44,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        headlineLarge: TextStyle(
          //XX
          color: _textColor,
          fontSize: 40,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        headlineMedium: TextStyle(
          //XX
          color: _textColor,
          fontSize: 36,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        headlineSmall: TextStyle(
          //XX
          color: _textColor,
          fontSize: 32,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        titleLarge: TextStyle(
          color: _textColor,
          fontSize: 28,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        titleMedium: TextStyle(
          color: _textColor,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
        ),
        titleSmall: TextStyle(
          color: _textColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
        ),
        labelLarge: TextStyle(
          color: _textColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
        ),
        labelMedium: TextStyle(
          color: _colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),
        labelSmall: TextStyle(
          color: _textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
        ),
        bodyLarge: TextStyle(
          color: _textColor,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        bodyMedium: TextStyle(
          color: _textColor,
          fontSize: 20,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
        bodySmall: TextStyle(
          color: _textColor,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
      );
}
