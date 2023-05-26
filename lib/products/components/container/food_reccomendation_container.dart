import 'package:digital_order_system/_export_ui.dart';

class FoodReccomendationContainer extends StatelessWidget with BaseSingleton {
  final DecorationImage? image;
  final Widget? child;
  const FoodReccomendationContainer({
    super.key,
    this.image,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.val21x,
      width: context.val21x,
      decoration: BoxDecoration(
        color: colors.charismaticRed,
        borderRadius: context.borderRadius4x,
        image: image,
      ),
      child: child,
    );
  }
}
