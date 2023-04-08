import 'package:digital_order_system/_export_ui.dart';

class UserSelectionView extends StatelessWidget {
  const UserSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingVertical15x,
        child: Column(
          children: [
            CircleAvatar(
              radius: context.val5x,
              child: const Icon(Icons.abc),
            ),
            context.emptySizedHeightBox7x,
            SizedBox(
              child: Image.asset("Restaurant".toPng),
            ),
            context.emptySizedHeightBox9x,
            specialButton(context, "Sign In", Colors.red, Colors.white),
            context.emptySizedHeightBox2x,
            specialButton(context, 'Sign Up', Colors.white, Colors.red)
          ],
        ),
      ),
    );
  }
//TODO: UI kit klasörü içine companent yap.
  Widget specialButton(
    BuildContext context,
    String buttonLabel,
    Color backgroundColor,
    Color outherColor,
  ) {
    return Container(
      padding: context.paddingHorizontal2x,
      height: context.val8x,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: context.borderRadius7x,
          ),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              buttonLabel,
              style: TextStyle(
                color: outherColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: outherColor,
            ),
          ],
        ),
      ),
    );
  }
}
