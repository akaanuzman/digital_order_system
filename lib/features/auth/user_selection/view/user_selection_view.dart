import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/core/enums/custom_button_enum.dart';
import 'package:digital_order_system/uikit/button/custom_button.dart';
import 'package:digital_order_system/uikit/button/custom_outlined_button.dart';

class UserSelectionView extends StatelessWidget with BaseSingleton {
  const UserSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding5x,
        child: Column(
          children: [
            context.emptySizedHeightBox6x,
            Image.asset(imageConstants.logo),
            context.emptySizedHeightBox7x,
            SizedBox(
              child: Image.asset("Restaurant".toPng),
            ),
            context.emptySizedHeightBox9x,
            CustomButton.icon(
              context: context,
              buttonType: CustomButtonEnum.large,
              label: "Sign In",
              icon: Icons.arrow_forward,
            ),
            context.emptySizedHeightBox2x,
            CustomOutlinedButton.icon(
              context: context,
              buttonType: CustomButtonEnum.large,
              label: "Sign Up",
              icon: Icons.arrow_forward,
            ),
          ],
        ),
      ),
    );
  }
}