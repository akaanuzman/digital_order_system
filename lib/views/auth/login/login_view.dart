import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/views/auth/register/register_view.dart';
import 'package:digital_order_system/views/common/navbar/navbar_view.dart';

import '../../../products/components/button/custom_button.dart';
import '../../../products/components/row/special_checkbox_text.dart';
import '../../../products/components/row/special_row_button.dart';
import '../../../products/components/text/display_medium_text.dart';
import '../../../products/components/text_field/special_text_field.dart';
import '../../../products/enums/custom_button_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatelessWidget with BaseSingleton {
  final bool isUser;
  const LoginView({
    super.key,
    required this.isUser,
  });

  void loginOperation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NavbarView(),
      ),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NavbarView(),
      ),
    );
  }

  void goToRegisterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterView(isUser: isUser),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: ListView(
          padding: context.padding3x,
          children: [
            context.emptySizedHeightBox6x,
            image(),
            context.emptySizedHeightBox2x,
            title(context),
            context.emptySizedHeightBox3x,
            emailField(context),
            context.emptySizedHeightBox2x,
            passwordField(context),
            rememberMeSection(context),
            context.emptySizedHeightBox1x,
            loginBtn(context),
            dontHaveAnAccountSection(context),
          ],
        ),
      ),
    );
  }

  AspectRatio image() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Image.asset(
        isUser ? imageConstants.loginUser : imageConstants.loginRestaurant,
      ),
    );
  }

  DisplayMediumText title(BuildContext context) {
    return DisplayMediumText(
      textLabel: isUser
          ? AppLocalizations.of(context)!.loginWithUser
          : AppLocalizations.of(context)!.loginWithRestaurant,
    );
  }

  DisplayMediumTextField emailField(BuildContext context) {
    return DisplayMediumTextField(
      labelText: AppLocalizations.of(context)!.emailLabelText,
      suffixIcon: const Icon(Icons.email),
      hintText: stringConstants.loginEmailHintText,
    );
  }

  DisplayMediumTextField passwordField(BuildContext context) {
    return DisplayMediumTextField(
      labelText: AppLocalizations.of(context)!.passwordLabelText,
      suffixIcon: const Icon(Icons.visibility_off),
      hintText: stringConstants.loginPasswordHintText,
    );
  }

  SpecialRow rememberMeSection(BuildContext context) {
    return SpecialRow(
      leftText: AppLocalizations.of(context)!.rememberMe,
      rightText: AppLocalizations.of(context)!.forgotPassword,
    );
  }

  Padding loginBtn(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontal8x,
      child: CustomButton(
        context: context,
        buttonType: CustomButtonEnum.medium,
        label: AppLocalizations.of(context)!.loginBtn,
        onTap: () => loginOperation(context),
      ),
    );
  }

  SpecialRowButton dontHaveAnAccountSection(BuildContext context) {
    return SpecialRowButton(
      firstText: AppLocalizations.of(context)!.dontHaveAnAccount,
      buttonText: AppLocalizations.of(context)!.registerBtn,
      onPressed: () => goToRegisterView(context),
    );
  }
}
