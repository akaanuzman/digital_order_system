import 'package:device_preview/device_preview.dart';
import 'package:digital_order_system/core/base/base_singleton.dart';
import 'package:digital_order_system/core/constants/app_constants.dart';
import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:digital_order_system/features/common/splash/view/splash_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  AppConstants constants = AppConstants.instance;
  runApp(
    MultiProvider(
      providers: constants.providers,
      child: DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Device preview parameters...
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      // Device preview parameters...

      debugShowCheckedModeBanner: constants.debugShowCheckedModeBanner,
      supportedLocales: constants.supportedLocales,
      localizationsDelegates: constants.localizationsDelegates,
      title: constants.appTitle,
      theme: theme.themeData,
      navigatorKey: NavigationService.navigatorKey,
      home: SplashView(),
    );
  }
}
