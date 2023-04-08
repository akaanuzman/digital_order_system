import 'package:flutter/material.dart';

import 'ITheme.dart';
import 'text/my_texts.dart';

class MyTheme extends ITheme {
  static MyTheme? _instance;
  static MyTheme get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = MyTheme.init();
      return _instance!;
    }
  }

  MyTheme.init();

  ThemeData get themeData => ThemeData(
        // colorSchemeSeed: colors.redSavinaPepper,
        // useMaterial3: true,
        textTheme: MyTexts.instance.textTheme,
        scaffoldBackgroundColor: colors.grey05,
      );
}
