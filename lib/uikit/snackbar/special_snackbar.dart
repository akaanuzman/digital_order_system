import 'package:flutter/material.dart';

import '../../core/extensions/ui_extensions.dart';
import '../../core/theme/color/my_colors.dart';

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
              color: contentColor ?? MyColors.instance.white,
              fontWeight: context.fw700,
            ),
          ),
          action: SnackBarAction(
            label: actionLabel,
            onPressed: () {},
            textColor: MyColors.instance.white,
          ),
          duration: context.durationSlow1x,
          backgroundColor: bgColor,
          key: key,
        );
}
