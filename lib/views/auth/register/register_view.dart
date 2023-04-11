import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/products/components/button/custom_button.dart';
import 'package:digital_order_system/products/components/row/special_row_button.dart';

import '../../../products/components/text/special_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: ListView(
          padding: context.padding3x,
          children: [
            context.emptySizedHeightBox4x,
            SizedBox(
              child: Image.asset("signup".toPng),
            ),
            context.emptySizedHeightBox2x,
            const SpecialText(
              textLabel: "Sign Up",
            ),
            context.emptySizedHeightBox2x,
            specialTextField(
              context,
              "Email",
              const Icon(Icons.done),
            ),
            context.emptySizedHeightBox2x,
            specialTextField(
              context,
              "Password",
              const Icon(Icons.visibility_off),
            ),
            context.emptySizedHeightBox2x,
            Padding(
              padding: context.paddingHorizontal9x,
              child: CustomButton(
                  context: context,
                  buttonType: CustomButtonEnum.medium,
                  label: "Sign Up"),
            ),
            // veryAlertButton(context, "Sign In"),
            context.emptySizedWidthBox2x,
            const SpecialRowButton(
              firstText: "Already have an account?",
              buttonText: "Sign In",
            )
          ],
        ),
      ),
    );
  }

  Widget specialText(BuildContext context, String textLabel) {
    return Center(
      child: Text(
        textLabel,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.red,
          fontSize: context.val4x,
        ),
      ),
    );
  }

  Widget specialTextField(BuildContext context, String labelText, Icon icon) {
    return Container(
      padding: context.paddingHorizontal2x,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: context.borderRadius3x,
          ),
          labelText: labelText,
          suffixIcon: icon,
        ),
      ),
    );
  }
}
