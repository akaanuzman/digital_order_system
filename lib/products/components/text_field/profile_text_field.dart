import 'package:flutter/services.dart';

import '../../../_export_ui.dart';

class ProfileTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  const ProfileTextField({
    super.key,
    required this.labelText,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: readOnly,
      controller: controller,
      onTap: onTap,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: context.textTheme.bodyLarge,
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
