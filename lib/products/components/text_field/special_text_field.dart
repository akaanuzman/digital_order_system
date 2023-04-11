import 'package:digital_order_system/core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

class SpecialTextField extends StatelessWidget {
  final String labelText;
  final Widget suffixIcon;
  final String hintText;
  const SpecialTextField({super.key, required this.labelText, required this.suffixIcon, required this.hintText});

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