import '../../../_export_ui.dart';
import '../../../products/view_models/splash_view_model.dart';
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
        builder: (_, snapshot) => pv.screenSelectionByStorage(snapshot),
      ),
    );
  }

  FadeInUp body(BuildContext context) {
    return FadeInUp(
      child: Center(
        child: Padding(
          padding: context.padding4x,
          child: Column(
            mainAxisAlignment: context.mainAxisACenter,
            children: [
              image,
              context.emptySizedHeightBox4x,
              appTitle(context),
            ],
          ),
        ),
      ),
    );
  }

  Image get image => Image.asset(imageConstants.splashLogo);

  Text appTitle(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.appName,
      style: context.textTheme.displayLarge,
    );
  }
}
