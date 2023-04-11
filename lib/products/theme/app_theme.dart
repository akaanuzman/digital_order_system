import 'package:flutter/material.dart';

import 'ITheme.dart';

class AppTheme extends ITheme {
  static AppTheme? _instance;
  static AppTheme get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppTheme.init();
      return _instance!;
    }
  }

  AppTheme.init();

  ThemeData get themeData => ThemeData(
        // colorSchemeSeed: colors.redSavinaPepper,
        // useMaterial3: true,
        primaryColor: colors.redSavinaPepper,
        colorScheme: colorScheme,
        textTheme: texts.textTheme,
        elevatedButtonTheme: elevatedButton,
        outlinedButtonTheme: outlinedButton,
        textButtonTheme: textButton,
        appBarTheme: appBarTheme,
        bottomNavigationBarTheme: bottomNavbarTheme,
      );

  ColorScheme get colorScheme {
    return const ColorScheme.light().copyWith(
      primary: colors.redSavinaPepper,
    );
  }

  ElevatedButtonThemeData get elevatedButton {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: texts.textTheme.headlineSmall,
      ),
    );
  }

  OutlinedButtonThemeData get outlinedButton {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: colors.white,
        textStyle: texts.textTheme.headlineSmall,
      ),
    );
  }

  TextButtonThemeData get textButton {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: texts.textTheme.titleMedium,
      ),
    );
  }

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      titleTextStyle: texts.textTheme.headlineLarge,
    );
  }

  BottomNavigationBarThemeData get bottomNavbarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: colors.redSavinaPepper,
      selectedIconTheme: IconThemeData(
        color: colors.notYoCheese,
        size: 30,
      ),
      unselectedIconTheme:IconThemeData(
        color: colors.white,
        size: 22,
      ),
    );
  }
}
