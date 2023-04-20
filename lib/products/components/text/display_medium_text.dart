import 'package:flutter/material.dart';

import '../../../core/extensions/ui_extensions.dart';

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
