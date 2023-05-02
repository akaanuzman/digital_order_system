import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';


class DisplayMediumText extends StatelessWidget {
  final String textLabel;
  const DisplayMediumText({
    super.key,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        textLabel,
        style: context.textTheme.displayMedium,
      ),
    );
  }
}
