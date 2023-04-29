import 'package:device_preview/device_preview.dart';
import 'package:digital_order_system/views/test.dart';
import 'products/constants/app_constants.dart';
import 'products/initialize/application_initialize.dart';
import 'views/common/splash/splash_view.dart';
import 'package:flutter/foundation.dart';
import '_export_ui.dart';

void main() async {
  await ApplicationInitialize.init();
  runApp(
    MultiProvider(
      providers: AppConstants.instance.providers,
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
      home: Test(),
    );
  }
}