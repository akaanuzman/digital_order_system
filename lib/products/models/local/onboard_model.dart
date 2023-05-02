import '../../../core/utils/navigator_service.dart';
import '../../constants/image_constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardModel {
  final String imageUrl;
  final String title;
  final String subtitle;

  OnboardModel({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });
}

extension OnboardModelExtension on OnboardModel {
  static List<OnboardModel> get pages => [
        OnboardModel(
          imageUrl: ImageConstants.onboardFirst.toPng,
          title: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardFirstTitle,
          subtitle: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardFirstSubtitle,
        ),
        OnboardModel(
          imageUrl: ImageConstants.onboardSecond.toPng,
          title: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardSecondTitle,
          subtitle: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardSecondSubtitle,
        ),
        OnboardModel(
          imageUrl: ImageConstants.onboardThird.toPng,
          title: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardThirdTitle,
          subtitle: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardThirdSubtitle,
        ),
      ];
}
