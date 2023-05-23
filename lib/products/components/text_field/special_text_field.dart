import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';


class SpecialTextField extends StatelessWidget {
  final TextEditingController controller;
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
    super.key,
    required this.controller,
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
      controller: controller,
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
