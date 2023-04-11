import 'package:digital_order_system/_export_ui.dart';

class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = ImageConstants.init();
      return _instance!;
    }
  }

  ImageConstants.init();

  final String splashLogo = "splash_logo".toPng;
  final String onboardFirst = "onboarding0".toPng;
  final String onboardSecond = "onboarding1".toPng;
  final String onboardThird = "onboarding2".toPng;
  final String logo = "logo".toPng;
  final String background = "background".toPng;
  final String pana = "pana".toPng;
  final String restaurant = "restaurant".toPng;
  final String signUp = "signup".toPng;
}
