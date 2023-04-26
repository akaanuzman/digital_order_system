import 'package:flutter/material.dart';

import '../../../core/extensions/ui_extensions.dart';

class SpecialTextField extends StatelessWidget {
  final String labelText;
  final Widget suffixIcon;
  final String? hintText;
  final bool obscureText;
  final TextStyle? textFormFieldTextStyle;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  const SpecialTextField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    this.hintText,
    this.obscureText = false,
    this.textFormFieldTextStyle,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      style: textFormFieldTextStyle,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
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
