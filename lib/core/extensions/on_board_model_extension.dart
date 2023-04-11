import 'package:digital_order_system/core/constants/image_constants.dart';
import 'package:digital_order_system/core/utils/navigator_service.dart';
import '../../features/auth/onboard/model/onboard_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension OnboardModelExtension on OnboardModel {
  static List<OnboardModel> get pages => [
        OnboardModel(
          imageUrl: ImageConstants.instance.onboardFirst,
          title: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardFirstTitle,
          subtitle: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardFirstSubtitle,
        ),
        OnboardModel(
            imageUrl: ImageConstants.instance.onboardSecond,
            title: AppLocalizations.of(
                    NavigationService.navigatorKey.currentContext!)!
                .onboardSecondTitle,
            subtitle: AppLocalizations.of(
                    NavigationService.navigatorKey.currentContext!)!
                .onboardSecondSubtitle),
        OnboardModel(
          imageUrl: ImageConstants.instance.onboardThird,
          title: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardThirdTitle,
          subtitle: AppLocalizations.of(
                  NavigationService.navigatorKey.currentContext!)!
              .onboardThirdSubtitle,
        ),
      ];
}
