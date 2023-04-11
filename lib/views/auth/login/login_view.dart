import 'package:digital_order_system/_export_ui.dart';

import '../../../products/components/button/custom_button.dart';
import '../../../products/components/row/special_checkbox_text.dart';
import '../../../products/components/row/special_row_button.dart';
import '../../../products/components/text/special_text.dart';
import '../../../products/components/text_field/special_text_field.dart';
import '../../../products/enums/custom_button_enum.dart';

class LoginView extends StatelessWidget with BaseSingleton {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: ListView(
          padding: context.padding3x,
          children: [
            context.emptySizedHeightBox6x,
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.asset(imageConstants.pana),
            ),
            context.emptySizedHeightBox2x,
            const SpecialText(
              textLabel: "Sign In",
            ),
            context.emptySizedHeightBox3x,
            const SpecialTextField(
              labelText: "Email",
              suffixIcon: Icon(
                Icons.done,
              ),
              hintText: "example@gmail.com",
            ),
            context.emptySizedHeightBox2x,
            const SpecialTextField(
              labelText: "Password",
              suffixIcon: Icon(Icons.visibility_off),
              hintText: "*********",
            ),
            const SpecialRow(
              leftText: "Remember me",
              rightText: "Forgot password?",
            ),
            context.emptySizedHeightBox1x,
            Padding(
              padding: context.paddingHorizontal8x,
              child: CustomButton(
                context: context,
                buttonType: CustomButtonEnum.medium,
                label: "Sign In",
              ),
            ),
            const SpecialRowButton(
              firstText: "Don't have an account",
              buttonText: "Sign Up",
            ),
          ],
        ),
      ),
    );
  }
}
