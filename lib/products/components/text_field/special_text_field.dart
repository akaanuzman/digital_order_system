import '../../../core/extensions/ui_extensions.dart';
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
  final bool readOnly;
  final VoidCallback? onTap;
  const SpecialTextField({
  const DisplayMediumTextField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    this.hintText,
    this.obscureText = false,
    this.textFormFieldTextStyle,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      onTap: onTap,
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
