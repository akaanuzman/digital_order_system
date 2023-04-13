import '../../../_export_ui.dart';
import '../../../products/enums/custom_button_enum.dart';
import '../../../products/components/button/custom_button.dart';
import '../../../products/components/button/custom_outlined_button.dart';
import '../../../products/view_models/user_selection_view_model.dart';
import '../login/login_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserSelectionView extends StatelessWidget with BaseSingleton {
  const UserSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final pv = Provider.of<UserSelectionViewModel>(context, listen: false);
    return Scaffold(
      body: FadeInUp(
        child: Padding(
          padding: context.padding5x,
          child: Column(
            children: [
              context.emptySizedHeightBox6x,
              Image.asset(imageConstants.logo),
              context.emptySizedHeightBox7x,
              Image.asset(imageConstants.restaurant),
              context.emptySizedHeightBox9x,
              loginWithRestaurantBtn(context, pv),
              context.emptySizedHeightBox2x,
              loginWithUserBtn(context, pv),
            ],
          ),
        ),
      ),
    );
  }

  CustomButton loginWithRestaurantBtn(
      BuildContext context, UserSelectionViewModel pv) {
    return CustomButton.icon(
      context: context,
      buttonType: CustomButtonEnum.large,
      label: AppLocalizations.of(context)!.loginWithRestaurantBtn,
      icon: Icons.arrow_forward,
      onTap: () {
        pv.chooseRestaurant;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoginView(isUser: pv.isUser),
          ),
        );
      },
    );
  }

  CustomOutlinedButton loginWithUserBtn(
      BuildContext context, UserSelectionViewModel pv) {
    return CustomOutlinedButton.icon(
      context: context,
      buttonType: CustomButtonEnum.large,
      label: AppLocalizations.of(context)!.loginWithUserBtn,
      icon: Icons.arrow_forward,
      onTap: () {
        pv.chooseUser;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => LoginView(isUser: pv.isUser),
          ),
        );
      },
    );
  }
}
