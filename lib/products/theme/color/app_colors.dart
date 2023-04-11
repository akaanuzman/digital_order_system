import 'dart:math';

import 'package:flutter/material.dart';

import '../../base/base_singleton.dart';

class AppColors with BaseSingleton {
  static AppColors? _instance;
  static AppColors get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppColors.init();
      return _instance!;
    }
  }

  AppColors.init();

  /// App Colors
  Color get primaryBoxShadowColor => const Color(0x1a208dfe);
  Color get textColor => const Color(0xff212121);
  Color get redSavinaPepper => const Color(0xffF10027);
  Color get charismaticRed => const Color(0xffEA2242);
  Color get notYoCheese => const Color(0xffFFC42E);
  Color get orangeade => const Color(0xffE65037);
  Color get mandarinJelly => const Color(0xffFD8700);
  Color get gray => const Color(0xff979797);
  Color get darkBlue => const Color(0x331b39ff);
  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
}
