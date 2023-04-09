import 'package:digital_order_system/_export_ui.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: ListView(
          padding: context.paddingVertical8x,
          children: [
            SizedBox(
              child: Image.asset("signup".toPng),
            ),
            context.emptySizedHeightBox3x,
            specialText(context, "Sign Up"),
            context.emptySizedHeightBox4x,
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
            verySpecialButton(context, "Sign In"),
            context.emptySizedWidthBox2x,
            Row(
              //TODO: companent yap
              mainAxisAlignment: context.mainAxisACenter,
              children: [
                Text(
                  "Already have an account?", //sign in textbutton.
                  style: TextStyle(
                    fontSize: context.val2x,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign In",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget verySpecialButton(BuildContext context, String buttonLabel) {
    return Container(
      padding: context.paddingHorizontal2x,
      height: context.val8x,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: context.borderRadius7x,
          ),
          backgroundColor: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonLabel,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
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
