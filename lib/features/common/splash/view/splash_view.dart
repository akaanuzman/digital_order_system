import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/features/auth/login/view/login_view.dart';
import 'package:digital_order_system/features/auth/onboard/view/onboard_view.dart';
import '../viewmodel/splash_view_model.dart';

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
                return !snapshot.data!
                    ? OnboardView()
                    : const LoginView();
              } else if (!snapshot.hasData) {
                return OnboardView();
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
              Image.asset("splash_logo".toPng),
              context.emptySizedHeightBox4x,
              Text(
                "Tasty Town",
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
