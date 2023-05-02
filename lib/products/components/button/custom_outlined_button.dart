import '../../enums/custom_button_enum.dart';
import '../../../core/extensions/ui_extensions.dart';
import '../../theme/color/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends Container {
  final BuildContext context;
  final CustomButtonEnum buttonType;
  final String label;
  final VoidCallback? onTap;

  CustomOutlinedButton({
    super.key,
    required this.context,
    required this.buttonType,
    required this.label,
    this.onTap,
  }) : super(
          height: _height(buttonType, context),
          width: context.maxFinite,
          decoration: _decoration(buttonType, context),
          child: OutlinedButton(
            onPressed: onTap ?? () {},
            style: _buttonStyle(context, buttonType),
            child: Text(label),
          ),
        );

  CustomOutlinedButton.icon({
    super.key,
    required this.context,
    required this.buttonType,
    required this.label,
    required IconData icon,
    this.onTap,
  }) : super(
          height: _height(buttonType, context),
          decoration: _decoration(buttonType, context),
          child: OutlinedButton(
            onPressed: onTap ?? () {},
            style: _buttonStyle(context, buttonType),
            child: Padding(
              padding: context.padding1x,
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
      border: Border.all(
        color: AppColors.instance.redSavinaPepper,
        width: 1.35,
      ),
    );
  }

  static double _height(CustomButtonEnum buttonType, BuildContext context) {
    return buttonType == CustomButtonEnum.small
        ? context.val8x
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

  static ButtonStyle _buttonStyle(
      BuildContext context, CustomButtonEnum buttonType) {
    return ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: _borderRadius(buttonType, context),
      ),
    );
  }
}
