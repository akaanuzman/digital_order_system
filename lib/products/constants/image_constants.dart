import '../../_export_ui.dart';

enum ImageConstants1 {
  splashLogo('splash_logo'),
  logo('logo'),
  onboardFirst('onboarding0'),
  onboardSecond('onboarding1'),
  onboardThird('onboarding2'),
  background('background'),
  restaurant('restaurant'),
  signup('signup'),
  loginRestaurant('login_restaurant'),
  loginUser('login_user')
  ;

  final String value;
  const ImageConstants1(this.value);

  String get toPng => 'assets/images/$value.png';
  Image get toImage => Image.asset(toPng);
}
