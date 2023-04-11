import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/products/components/button/custom_button.dart';
import 'package:digital_order_system/products/components/button/custom_outlined_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserSelectionView extends StatelessWidget with BaseSingleton {
  const UserSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: Padding(
          padding: context.padding5x,
          child: Column(
            children: [
              context.emptySizedHeightBox6x,
              Image.asset(imageConstants.logo),
              context.emptySizedHeightBox7x,
              Image.asset("restaurant".toPng),
              context.emptySizedHeightBox9x,
              loginWithRestaurantBtn(context),
              context.emptySizedHeightBox2x,
              loginWithUserBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  CustomButton loginWithRestaurantBtn(BuildContext context) {
    return CustomButton.icon(
            context: context,
            buttonType: CustomButtonEnum.large,
            label: AppLocalizations.of(context)!.loginWithRestaurant,
            icon: Icons.arrow_forward,
          );
  }

  CustomOutlinedButton loginWithUserBtn(BuildContext context) {
    return CustomOutlinedButton.icon(
      context: context,
      buttonType: CustomButtonEnum.large,
      label: AppLocalizations.of(context)!.loginWithUser,
      icon: Icons.arrow_forward,
    );
  }
}
