import 'package:digital_order_system/_export_ui.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        child: ListView(
          padding: context.paddingVertical8x,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Image.asset("pana".toPng),
            ),
            // context.emptySizedHeightBox1x,
            specialText(context, "Sign In"),
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
            speacialRF(
              context,
              "Remember me",
              "Forgot password?",
            ),
            context.emptySizedHeightBox2x,
            verySpecialButton(context, "Sign In"),
            context.emptySizedHeightBox2x,
            Row( //TODO: companent haline getir
              mainAxisAlignment: context.mainAxisACenter,
              children: [
                Text(
                  "Don't have an account?", //sign in textbutton.
                  style: TextStyle(
                    fontSize: context.val2x,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //TODO: buttonları ui kit tarafına al. Comapanent haline getir.

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

  Widget speacialRF(BuildContext context, String textOne, String textTwo) {
    return Padding(
      padding: context.padding2x,
      child: Row(
        mainAxisAlignment: context.mainAxisASpaceBetween,
        children: [
          Text(
            textOne,
            style: TextStyle(
              fontSize: context.val2x,
            ),
          ),
          Text(
            textTwo,
            style: TextStyle(
              fontSize: context.val2x,
            ),
          ),
        ],
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
