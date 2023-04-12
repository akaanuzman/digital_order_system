import 'package:flutter/material.dart';

import '../../extensions/ui_extensions.dart';

class SpecialSnackbar extends SnackBar {
  SpecialSnackbar({
    Key? key,
    required BuildContext context,
    required String content,
    Color? contentColor,
    Color? bgColor,
    String actionLabel = "Close",
  }) : super(
          content: Text(
            content,
            style: context.textTheme.labelMedium!.copyWith(
              color: contentColor ?? Colors.white,
              fontWeight: context.fw700,
            ),
          ),
          action: SnackBarAction(
            label: actionLabel,
            onPressed: () {},
            textColor: Colors.white,
          ),
          duration: context.durationSlow1x,
          backgroundColor: bgColor,
          key: key,
        );
}
