import 'package:digital_order_system/core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class DisplayMediumTextField extends StatelessWidget {
  final String labelText;
  final Widget suffixIcon;
  final String? hintText;
  const DisplayMediumTextField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: context.borderRadius3x,
        ),
        labelText: labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
      ),
    );
  }
}
