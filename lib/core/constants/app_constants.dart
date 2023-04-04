import 'package:digital_order_system/features/auth/onboard/viewmodel/onboard_view_model.dart';
import 'package:digital_order_system/features/common/splash/viewmodel/splash_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/single_child_widget.dart';

import '../utils/navigation_service.dart';

class AppConstants {
  static AppConstants? _instance;
  static AppConstants get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = AppConstants.init();
      return _instance!;
    }
  }

  AppConstants.init();

  String get appTitle => "Digital Order System";
  bool get debugShowCheckedModeBanner => false;
  get localizationsDelegates => AppLocalizations.localizationsDelegates;
  get supportedLocales => AppLocalizations.supportedLocales;
  get navigatorKey => NavigationService.navigatorKey;

  final List<SingleChildWidget> _providers = [
    ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => OnboardViewModel(),
    ),
  ];

  List<SingleChildWidget> get providers => _providers;
}
