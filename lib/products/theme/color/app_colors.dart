import 'dart:math';

import 'package:flutter/material.dart';

import '../../utility/base/base_singleton.dart';

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
  Color get scropion => const Color(0xff5C5C5C);
  Color get darkBlue => const Color(0x331b39ff);
  Color get orochimaru => const Color(0xffD9D9D9);
  Color get successSnackbarColor => const Color(0xff34C759);
  Color get failureSnackbarColor => const Color(0xffCC2229);
  Color get circleColor => const Color(0xffFFEDED);

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];

  Color withOpacity({
    required Color color,
    required double opacity,
  }) {
    return color.withOpacity(opacity);
  }
}
