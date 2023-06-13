import 'products/constants/app_constants.dart';
import 'products/initialize/application_initialize.dart';
import 'views/common/splash/splash_view.dart';
import '_export_ui.dart';

void main() async {
  await ApplicationInitialize.init;
  runApp(
    MultiProvider(
      providers: AppConstants.instance.providers,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with BaseSingleton {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
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