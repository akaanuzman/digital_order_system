import 'package:digital_order_system/products/enums/text_sizes_enum.dart';
import 'package:flutter/material.dart';

import '../color/app_colors.dart';

class AppTexts {
  static AppTexts? _instance;
  static AppTexts get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppTexts.init();
      return _instance!;
    }
  }

  AppTexts.init();

  AppColors get _colors => AppColors.instance;
  Color get _textColor => _colors.textColor;
  String get _fontFamily => 'Montserrat';

  TextTheme get textTheme => TextTheme(

        // 35 - semibold ** Splash Screen
        displayLarge: TextStyle(
          color: _colors.notYoCheese,
          fontSize: TextSizesEnum.xxxLarge.value,
          fontWeight: FontWeight.w600,
          fontFamily: _fontFamily,
        ),
        
        // 28 - bold  ** Sign in, Sign up
        displayMedium: TextStyle(
          color: _colors.redSavinaPepper,
          fontSize: TextSizesEnum.xxLarge.value,
          fontWeight: FontWeight.bold,
          fontFamily: _fontFamily,
        ),

        // 24 - bold ** Splash and others
        displaySmall: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.xLarge.value,
          fontWeight: FontWeight.bold,
          fontFamily: _fontFamily,
        ),

        // 20 - bold ** Appbar Title
        headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: TextSizesEnum.large.value,
          fontWeight: FontWeight.bold,
          fontFamily: _fontFamily,
        ),

        // 18 - medium
        headlineMedium: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.medium.value,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
        ),

        // 16 - bold  ** For buttons
        headlineSmall: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.normal.value,
          fontWeight: FontWeight.bold,
          fontFamily: _fontFamily,
        ),

        // 16 - regular
        titleLarge: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.normal.value,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),

        // 14 - regular
        titleMedium: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.xSmall.value,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),

        // 12 - regular
        titleSmall: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.xxSmall.value,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),

        // 16 - medium
        labelLarge: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.normal.value,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
        ),

        // 14 - medium
        labelMedium: TextStyle(
          color: _textColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
          fontStyle: FontStyle.normal,
        ),

        // 12 - medium
        labelSmall: TextStyle(
          color: _textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: _fontFamily,
        ),

        // 16 - semibold
        bodyLarge: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.normal.value,
          fontWeight: FontWeight.w600,
          fontFamily: _fontFamily,
        ),

        // 15 - semibold
        bodyMedium: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.small.value,
          fontWeight: FontWeight.w600,
          fontFamily: _fontFamily,
        ),

        // 10 - regular
        bodySmall: TextStyle(
          color: _textColor,
          fontSize: TextSizesEnum.xxxSmall.value,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamily,
        ),
      );
}
