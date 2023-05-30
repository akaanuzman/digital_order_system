import 'package:flutter/material.dart';

class CustomRadioText<T> extends StatelessWidget {
  final dynamic value;
  final dynamic groupValue;
  final Function(dynamic)? onChanged;
  final String text;
  const CustomRadioText({
    super.key,
    this.value,
    this.groupValue,
    this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(text),
      ],
    );
  }
}
