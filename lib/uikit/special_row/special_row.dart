import 'package:digital_order_system/core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class SpecialRow extends StatelessWidget {
  final String leftText;
  final String rightText;
  const SpecialRow(
      {super.key, required this.leftText, required this.rightText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: context.mainAxisASpaceBetween,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: false,
              onChanged: (value) => {},
            ),
            Text(
              leftText,
              style: context.textTheme.titleSmall,
            ),
          ],
        ),
        Text(
          rightText,
          style: context.textTheme.titleSmall,
        ),
      ],
    );
  }
}
