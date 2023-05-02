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
      return "https://play.google.com/store/apps/details?id=com.singularitysoftware.anytime";
    }
    if (Platform.isIOS) {
      return "https://apps.apple.com/tr/app/anytime/id1615656130?l=tr";
    }

    throw Exception('Platform unused please check your platform!');
  }
}
