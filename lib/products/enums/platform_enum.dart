import 'dart:io';

enum PlatformEnum {
  android,
  iOS;

  static String get versionName {
    if (Platform.isAndroid) {
      return PlatformEnum.android.name;
    }
    if (Platform.isIOS) {
      return PlatformEnum.iOS.name;
    }

    throw Exception('Platform unused please check your platform!');
  }

  static String get getMarketUrl {
    if (Platform.isAndroid) {
      return "";
    }
    if (Platform.isIOS) {
      return "";
    }

    throw Exception('Platform unused please check your platform!');
  }
}
