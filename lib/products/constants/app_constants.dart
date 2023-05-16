import 'package:digital_order_system/views/home/order/restaurant_current_orders_view.dart';
import 'package:digital_order_system/views/home/order/restaurant_orders_view.dart';
import 'package:digital_order_system/views/home/order/restaurant_past_orders_view.dart';
import 'package:digital_order_system/views/home/user_home_view.dart';
import 'package:digital_order_system/views/test.dart';

import '../view_models/login_view_model.dart';
import '../view_models/register_view_model.dart';
import '../../views/home/restaurant_home_view.dart';

import '../../_export_ui.dart';
import '../view_models/splash_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/single_child_widget.dart';

import '../view_models/navbar_view_model.dart';
import '../view_models/onboard_view_model.dart';

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

  String get appTitle => "Tasty Town";
  bool get debugShowCheckedModeBanner => false;
  get localizationsDelegates => AppLocalizations.localizationsDelegates;
  get supportedLocales => AppLocalizations.supportedLocales;

  final List<SingleChildWidget> _providers = [
    ChangeNotifierProvider(
      create: (_) => SplashViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => OnboardViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserSelectionViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => LoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => RegisterViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => NavbarViewModel(),
    ),
  ];

  List<SingleChildWidget> get providers => _providers;

  List<Widget> userNavbarViews = [
    const UserHomeView(),
    const Test(),
    const Scaffold(),
  ];

  List<Widget> restaurantNavbarViews = [
    const RestaurantHomeView(),
    const RestaurantOrdersView(),
    const Scaffold(),
  ];

  List<Widget> restaurantOrderTabBarViews = [
    const RestaurantPastOrdersView(),
    const RestaurantCurrentOrdersView(),
  ];
}
