import 'package:digital_order_system/core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class SpecialRowButton extends StatelessWidget {
  final String firstText;
  final String buttonText;
  final VoidCallback? onPressed;
  const SpecialRowButton({
    super.key,
    required this.firstText,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: context.mainAxisACenter,
      children: [
        Text(
          firstText,
          style: context.textTheme.titleMedium,
        ),
        TextButton(
          onPressed: onPressed ?? () {},
          child: Text(
            buttonText,
          ),
        )
      ],
    );
  }
}
