import 'package:digital_order_system/core/base/base_singleton.dart';
import 'package:digital_order_system/core/constants/app_constants.dart';
import 'package:digital_order_system/core/utils/navigation_service.dart';
import 'package:digital_order_system/features/common/splash/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  AppConstants constants = AppConstants.instance;
  runApp(
      MultiProvider(
        providers: constants.providers,
        child: const MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: constants.debugShowCheckedModeBanner,
      title: constants.appTitle,
      theme: theme.themeData,
      navigatorKey: NavigationService.navigatorKey,
      home: SplashView(),
    );
  }
}
