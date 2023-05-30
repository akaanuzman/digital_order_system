import '../../_export_ui.dart';

enum ImageConstants {
  splashLogo('splash_logo'),
  logo('logo'),
  onboardFirst('onboarding0'),
  onboardSecond('onboarding1'),
  onboardThird('onboarding2'),
  background('background'),
  restaurant('restaurant'),
  signup('signup'),
  loginRestaurant('login_restaurant'),
  loginUser('login_user'),
  mainDishes('main_dishes'),
  ai('ai')
  ;
  
  
  final String value;
  const ImageConstants(this.value);

  String get toPng => 'assets/images/$value.png';
  String get toJpg => 'assets/images/$value.jpg';
  String get toJpeg => 'assets/images/$value.jpeg';
  Image get toImage => Image.asset(toPng);
}
