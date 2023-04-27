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
        unselectedWidgetColor: colors.gray,
        scaffoldBackgroundColor: Colors.grey.shade50,
        colorScheme: colorScheme,
        textTheme: texts.textTheme,
        elevatedButtonTheme: elevatedButtonTheme,
        outlinedButtonTheme: outlinedButtonTheme,
        textButtonTheme: textButtonTheme,
        appBarTheme: appBarTheme,
        bottomNavigationBarTheme: bottomNavbarTheme,
        checkboxTheme: checkboxTheme,
        cardTheme: cardTheme,
        listTileTheme: listTileTheme,
        tabBarTheme: tabbarTheme,
      );

  ColorScheme get colorScheme {
    return const ColorScheme.light().copyWith(
      primary: colors.redSavinaPepper,
    );
  }

  ElevatedButtonThemeData get elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: texts.textTheme.headlineSmall,
      ),
    );
  }

  OutlinedButtonThemeData get outlinedButtonTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        textStyle: texts.textTheme.headlineSmall,
      ),
    );
  }

  TextButtonThemeData get textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: texts.textTheme.titleMedium,
      ),
    );
  }

  AppBarTheme get appBarTheme {
    return AppBarTheme(
      titleTextStyle: texts.textTheme.headlineLarge,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  BottomNavigationBarThemeData get bottomNavbarTheme {
    return BottomNavigationBarThemeData(
      backgroundColor: colors.redSavinaPepper,
      selectedIconTheme: IconThemeData(
        color: colors.notYoCheese,
        size: 30,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.white,
        size: 22,
      ),
    );
  }

  CheckboxThemeData get checkboxTheme {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.disabled)) {
            return colors.gray;
          }
          if (states.contains(MaterialState.selected)) {
            return colors.redSavinaPepper;
          }
          return null;
        },
      ),
    );
  }

  CardTheme get cardTheme {
    return CardTheme(
      color: colors.redSavinaPepper,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }

  ListTileThemeData get listTileTheme {
    return const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
      style: ListTileStyle.drawer,
    );
  }

  TabBarTheme get tabbarTheme {
    return TabBarTheme(
      unselectedLabelColor: Colors.white.withOpacity(0.7),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          color: Colors.white,
          width: 4,
        ),
      ),
    );
  }
}
