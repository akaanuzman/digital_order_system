import 'package:digital_order_system/_export_ui.dart';

class RowIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final TextStyle? textStyle;
  final double? iconSize;
  final Color? iconColor;
  const RowIconText({
    super.key,
    required this.icon,
    required this.text,
    this.textStyle,
    this.iconSize,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        context.emptySizedWidthBox1x,
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
