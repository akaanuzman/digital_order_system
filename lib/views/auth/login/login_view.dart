import 'package:digital_order_system/products/constants/image_constants.dart';
import 'package:digital_order_system/products/enums/aspect_ratio_enum.dart';

import '../../../_export_ui.dart';
import '../../../products/view_models/login_view_model.dart';
import '../register/register_view.dart';
import '../../../products/components/button/custom_button.dart';
import '../../../products/components/row/special_checkbox_text.dart';
import '../../../products/components/row/special_row_button.dart';
import '../../../products/components/text/display_medium_text.dart';
import '../../../products/components/text_field/special_text_field.dart';
import '../../../products/enums/custom_button_enum.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatelessWidget with BaseSingleton {
  final userSelectionVM = Provider.of<UserSelectionViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );

  final loginVM = Provider.of<LoginViewModel>(
    NavigationService.navigatorKey.currentContext!,
    listen: false,
  );

  LoginView({super.key});

  Future loginOperation(BuildContext context) async {
    await loginVM.signInAsRestaurant;
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
      child: userSelectionVM.isUser
          ? ImageConstants.loginUser.toImage
          : ImageConstants.loginRestaurant.toImage,
    );
  }

  DisplayMediumText title(BuildContext context) {
    return DisplayMediumText(
      textLabel: userSelectionVM.isUser
          ? AppLocalizations.of(context)!.loginWithUser
          : AppLocalizations.of(context)!.loginWithRestaurant,
    );
  }

  SpecialTextField emailField(BuildContext context) {
    return SpecialTextField(
      controller: loginVM.emailController,
      labelText: AppLocalizations.of(context)!.emailLabelText,
      suffixIcon: const Icon(Icons.email),
      hintText: StringConstants.loginEmailHintText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget passwordField(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, userSelectionVM, _) {
        return SpecialTextField(
          controller: loginVM.passwordController,
          labelText: AppLocalizations.of(context)!.passwordLabelText,
          suffixIcon: IconButton(
            onPressed: () => userSelectionVM.openOrCloseObscureText,
            icon: userSelectionVM.isObscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          hintText: StringConstants.loginPasswordHintText,
          obscureText: userSelectionVM.isObscureText,
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
