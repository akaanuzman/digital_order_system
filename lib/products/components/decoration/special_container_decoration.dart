import '../../../core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';

import 'special_box_shadow.dart';

// Special boxdecoration feature used for containers

class SpecialContainerDecoration extends BoxDecoration {
  SpecialContainerDecoration({
    Key? key,
    required BuildContext context,
    Color? color,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    double? blurRadius,
    DecorationImage? image,
  }) : super(
          color: color ?? Colors.white,
          borderRadius: borderRadius ?? context.borderRadius4x,
          boxShadow: boxShadow ?? [SpecialBoxShadow(blurRadius: blurRadius)],
          image: image,
        );
}
