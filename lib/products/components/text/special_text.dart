import 'package:digital_order_system/core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class SpecialText extends StatelessWidget {
  final String textLabel;
  const SpecialText({super.key, required this.textLabel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textLabel,
        style: context.textTheme.displayMedium,
      ),
    );
  }
}
