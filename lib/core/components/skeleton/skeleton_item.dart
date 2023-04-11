// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:digital_order_system/core/extensions/ui_extensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SkeletonItem extends AspectRatio {
  SkeletonItem({
    super.key,
    required BuildContext context,
    double aspectRatio = 3.5,
  }) : super(
          aspectRatio: aspectRatio,
          child: Shimmer(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: context.borderRadius4x,
              ),
            ),
          ),
        );
}
