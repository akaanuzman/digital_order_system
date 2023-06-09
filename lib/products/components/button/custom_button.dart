// ignore_for_file: overridden_fields, annotate_overrides

import 'package:digital_order_system/core/extensions/ui_extensions.dart';
import 'package:digital_order_system/products/enums/custom_button_enum.dart';
import 'package:digital_order_system/products/theme/color/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends Container {
  final TextStyle? textStyle;
  final BuildContext context;
  final CustomButtonEnum buttonType;
  final String label;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final Color? bgColor;

  CustomButton({
    super.key,
    required this.context,
    required this.buttonType,
    required this.label,
    this.onTap,
    this.padding,
    this.textStyle,
    this.bgColor,
  }) : super(
          height: _height(buttonType, context),
          width: context.maxFinite,
          padding: padding,
          decoration: _decoration(buttonType, context),
          child: ElevatedButton(
            onPressed: onTap ?? () {},
            style: _buttonStyle(
              context,
              buttonType,
              textStyle,
              bgColor,
            ),
            child: Text(label),
          ),
        );

  CustomButton.icon({
    super.key,
    required this.context,
    required this.buttonType,
    required this.label,
    required IconData icon,
    this.onTap,
    this.padding,
    this.textStyle,
    this.bgColor,
  }) : super(
          height: _height(buttonType, context),
          decoration: _decoration(buttonType, context),
          padding: padding,
          child: ElevatedButton(
            onPressed: onTap ?? () {},
            style: _buttonStyle(
              context,
              buttonType,
              textStyle,
              bgColor,
            ),
            child: Padding(
              padding: padding ?? context.padding1x,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(label),
                  context.emptySizedWidthBox2x,
                  Icon(icon),
                ],
              ),
            ),
          ),
        );

  static BoxDecoration _decoration(
      CustomButtonEnum buttonType, BuildContext context) {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColors.instance.darkBlue,
          offset: const Offset(0, 7),
          blurRadius: 13,
          spreadRadius: -1,
        )
      ],
      borderRadius: _borderRadius(buttonType, context),
    );
  }

  static double _height(CustomButtonEnum buttonType, BuildContext context) {
    return buttonType == CustomButtonEnum.small
        ? context.val12x
        : buttonType == CustomButtonEnum.medium
            ? context.val15x
            : context.val15x * 1.25;
  }

  static BorderRadiusGeometry _borderRadius(
      CustomButtonEnum buttonType, BuildContext context) {
    return buttonType == CustomButtonEnum.small
        ? context.borderRadius4x
        : buttonType == CustomButtonEnum.medium
            ? context.borderRadius7x
            : context.borderRadius10x;
  }

  static ButtonStyle _buttonStyle(BuildContext context,
      CustomButtonEnum buttonType, TextStyle? textStyle, Color? bgColor) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius(buttonType, context),
      ),
      textStyle: textStyle,
      backgroundColor: bgColor,
    );
  }
}
