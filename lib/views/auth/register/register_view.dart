import 'package:digital_order_system/products/view_models/register_view_model.dart';

import '../../../_export_ui.dart';
import '../../../products/components/text/display_medium_text.dart';
import '../../../products/enums/custom_button_enum.dart';
import '../../../products/components/button/custom_button.dart';
import '../../../products/components/row/special_row_button.dart';
import '../login/login_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../products/components/text_field/special_text_field.dart';

class RegisterView extends StatelessWidget with BaseSingleton {
  final bool isUser;
  const RegisterView({
    super.key,
    required this.isUser,
  });

  void goToRegisterView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(isUser: isUser),
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
            context.emptySizedHeightBox4x,
            image(),
            context.emptySizedHeightBox2x,
            title(context),
            context.emptySizedHeightBox2x,
            emailField(context),
            context.emptySizedHeightBox2x,
            passwordField(context),
            context.emptySizedHeightBox2x,
            registerBtn(context),
            context.emptySizedWidthBox2x,
            alreadyHaveAnAcoountSection(context)
          ],
        ),
      ),
    );
  }

  Widget image() {
    return Image.asset(imageConstants.signup);
  }

  DisplayMediumText title(BuildContext context) {
    return DisplayMediumText(
      textLabel: isUser
          ? AppLocalizations.of(context)!.registerWithUser
          : AppLocalizations.of(context)!.registerWithRestaurant,
    );
  }

  DisplayMediumTextField emailField(BuildContext context) {
    return DisplayMediumTextField(
      labelText: AppLocalizations.of(context)!.emailLabelText,
      suffixIcon: const Icon(Icons.email),
      hintText: stringConstants.loginEmailHintText,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }

  Widget passwordField(BuildContext context) {
    return Consumer<RegisterViewModel>(
      builder: (context, pv, _) {
        return DisplayMediumTextField(
          labelText: AppLocalizations.of(context)!.passwordLabelText,
          suffixIcon: IconButton(
            onPressed: () => pv.openOrCloseObscureText,
            icon: pv.isObscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          hintText: stringConstants.loginPasswordHintText,
          obscureText: pv.isObscureText,
        );
      },
    );
  }

  Padding registerBtn(BuildContext context) {
    return Padding(
      padding: context.paddingHorizontal9x,
      child: CustomButton(
        context: context,
        buttonType: CustomButtonEnum.medium,
        label: AppLocalizations.of(context)!.registerBtn,
        onTap: () {},
      ),
    );
  }

  SpecialRowButton alreadyHaveAnAcoountSection(BuildContext context) {
    return SpecialRowButton(
      firstText: AppLocalizations.of(context)!.alreadyHaveAnAcoount,
      buttonText: AppLocalizations.of(context)!.loginBtn,
      onPressed: () => goToRegisterView(context),
    );
  }
}
