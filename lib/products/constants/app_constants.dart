import 'package:digital_order_system/products/view_models/customer_view_model.dart';
import 'package:digital_order_system/products/view_models/food_reccomendation_view_model.dart';
import 'package:digital_order_system/products/view_models/image_view_model.dart';
import 'package:digital_order_system/views/home/customer/customer_favorites_view.dart';
import 'package:digital_order_system/views/home/profile_view.dart';

import 'package:digital_order_system/views/home/restraurant/order/restaurant_current_orders_view.dart';
import 'package:digital_order_system/views/home/restraurant/order/restaurant_orders_view.dart';
import 'package:digital_order_system/views/home/restraurant/order/restaurant_past_orders_view.dart';
import 'package:digital_order_system/views/home/customer_home_view.dart';
import 'package:digital_order_system/products/view_models/customer_basket_view_model.dart';

import '../view_models/login_view_model.dart';
import '../view_models/register_view_model.dart';
import '../../views/home/restaurant_home_view.dart';

import '../../_export_ui.dart';
import '../view_models/restaurant_view_model.dart';
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
    ChangeNotifierProvider(
      create: (_) => ImageViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => FoodReccomendationViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => CustomerViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => RestaurantViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => CustomerBasketViewModel(),
    ),
  ];

  List<SingleChildWidget> get providers => _providers;

  List<Widget> userNavbarViews = [
    const CustomerHomeView(),
    const CustomerFavoritesView(),
    const ProfilePageView(),
  ];

  List<Widget> restaurantNavbarViews = [
    const RestaurantHomeView(),
    const RestaurantOrdersView(),
    const ProfilePageView(),
  ];

  List<Widget> restaurantOrderTabBarViews = [
    const RestaurantPastOrdersView(),
    const RestaurantCurrentOrdersView(),
  ];
}
