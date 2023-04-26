import 'package:digital_order_system/_export_ui.dart';

class InformationContainer extends StatelessWidget with BaseSingleton {
  final IconData icon;
  final String information;
  final EdgeInsetsGeometry? margin;

  const InformationContainer({
    super.key,
    required this.icon,
    required this.information,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return infoContainer(context);
  }

  Container infoContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.redSavinaPepper,
        borderRadius: context.borderRadius8x,
      ),
      padding: context.padding6x,
      margin: margin ?? context.padding3x,
      child: Row(
        children: [
          infoIcon(context),
          context.emptySizedWidthBox3x,
          infoText(context),
        ],
      ),
    );
  }

  Icon infoIcon(BuildContext context) {
    return Icon(
      icon,
      color: Colors.white,
      size: context.val14x,
    );
  }

  Flexible infoText(BuildContext context) {
    return Flexible(
      child: Text(
        information,
        style: context.textTheme.headlineSmall!.copyWith(color: Colors.white),
        maxLines: 5,
      ),
    );
  }
}
