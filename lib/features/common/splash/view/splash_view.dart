import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/features/auth/login/view/login_view.dart';
import 'package:digital_order_system/features/auth/onboard/view/onboard_view.dart';
import '../viewmodel/splash_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SplashView extends StatelessWidget with BaseSingleton {
  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final pv = Provider.of<SplashViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: colors.charismaticRed,
      body: FutureBuilder(
        future: pv.initPage,
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return body(context);
            default:
              if (snapshot.hasData) {
                return !snapshot.data! ? const OnboardView() : const LoginView();
              } else if (!snapshot.hasData) {
                return const OnboardView();
              }
              return body(context);
          }
        },
      ),
    );
  }

  FadeInUp body(BuildContext context) {
    return FadeInUp(
      child: Center(
        child: Padding(
          padding: context.padding4x,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageConstants.splashLogo),
              context.emptySizedHeightBox4x,
              Text(
                AppLocalizations.of(context)!.appName,
                style: context.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colors.notYoCheese,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
