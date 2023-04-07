import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/core/constants/image_constants.dart';
import '../../features/auth/onboard/model/onboard_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension OnboardModelExtension on OnboardModel {
  static List<OnboardModel>  pages(BuildContext context) => [
        OnboardModel(
          imageUrl: ImageConstants.instance.onboardFirst,
          title: AppLocalizations.of(context)!.onboardFirstTitle,
          subtitle:
              AppLocalizations.of(context)!.onboardFirstSubtitle,
        ),
        OnboardModel(
          imageUrl: ImageConstants.instance.onboardSecond,
          title: AppLocalizations.of(context)!.onboardSecondTitle,
          subtitle:
              AppLocalizations.of(context)!.onboardSecondSubtitle
        ),
        OnboardModel(
          imageUrl: ImageConstants.instance.onboardThird,
          title: AppLocalizations.of(context)!.onboardThirdTitle,
          subtitle:
              AppLocalizations.of(context)!.onboardThirdSubtitle,
        ),
      ];
}
