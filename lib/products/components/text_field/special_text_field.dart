import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';


class SpecialTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hintText;
  final bool obscureText;
  final TextStyle? textFormFieldTextStyle;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool? filled;
  final Color? fillColor;
  const SpecialTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.obscureText = false,
    this.textFormFieldTextStyle,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.onChanged,
    this.filled,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
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
        prefixIcon: prefixIcon,
        hintText: hintText,
        filled: filled,
        fillColor: fillColor,
      ),
    );
  }
}
