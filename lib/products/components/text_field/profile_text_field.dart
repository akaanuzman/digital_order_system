import 'package:digital_order_system/_export_ui.dart';
import 'package:flutter/material.dart';

class ProfileTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  const ProfileTextField(
      {super.key, required this.labelText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: context.textTheme.bodyLarge,
        hintText: hintText,
      ),
    );
  }
}
