import 'package:digital_order_system/products/enums/aspect_ratio_enum.dart';

import '../../../_export_ui.dart';
import '../../../products/view_models/login_view_model.dart';
import '../register/register_view.dart';
import '../../common/navbar/navbar_view.dart';

import '../../../products/components/button/custom_button.dart';
import '../../../products/components/row/special_checkbox_text.dart';
import '../../../products/components/row/special_row_button.dart';
import '../../../products/components/text/display_medium_text.dart';
import '../../../products/components/text_field/special_text_field.dart';
import '../../../products/enums/custom_button_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatelessWidget with BaseSingleton {
  final pv = Provider.of<UserSelectionViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );

  LoginView({super.key});

  void loginOperation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NavbarView(),
      ),
    );
  }

  void goToRegisterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegisterView(),
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
      aspectRatio: AspectRatioEnum.small.value,
      child: Image.asset(
        pv.isUser ? imageConstants.loginUser : imageConstants.loginRestaurant,
      ),
    );
  }

  DisplayMediumText title(BuildContext context) {
    return DisplayMediumText(
      textLabel: pv.isUser
          ? AppLocalizations.of(context)!.loginWithUser
          : AppLocalizations.of(context)!.loginWithRestaurant,
    );
  }

  SpecialTextField emailField(BuildContext context) {
    return SpecialTextField(
      labelText: AppLocalizations.of(context)!.emailLabelText,
      suffixIcon: const Icon(Icons.email),
      hintText: stringConstants.loginEmailHintText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget passwordField(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, pv, _) {
        return SpecialTextField(
          labelText: AppLocalizations.of(context)!.passwordLabelText,
          suffixIcon: IconButton(
            onPressed: () => pv.openOrCloseObscureText,
            icon: pv.isObscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          hintText: stringConstants.loginPasswordHintText,
          obscureText: pv.isObscureText,
          keyboardType: TextInputType.visiblePassword,
        );
      },
    );
  }

  Widget rememberMeSection(BuildContext context) {
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
