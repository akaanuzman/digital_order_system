import 'package:digital_order_system/_export_ui.dart';

class RowIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  const RowIconText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        context.emptySizedWidthBox1x,
        Text(text),
      ],
    );
  }
}
