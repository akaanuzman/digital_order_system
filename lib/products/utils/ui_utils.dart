
import 'package:digital_order_system/products/extensions/alert_extension.dart';
import 'package:flutter/material.dart';
import '../../core/components/snackbar/special_snackbar.dart';
import '../enums/alert_enum.dart';

class UIUtils {
  static UIUtils? _instance;
  static UIUtils get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = UIUtils.init();
      return _instance!;
    }
  }

  UIUtils.init();

  Divider get divider => const Divider(
        thickness: 1.5,
      );

  void showSnackBar({
    required String content,
    required BuildContext context,
    Color? contentColor,
    Color? bgColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SpecialSnackbar(
        context: context,
        content: content,
        contentColor: contentColor,
        bgColor: bgColor,
      ),
    );
  }

  void showAlertDialog({
    required BuildContext context,
    required AlertEnum alertEnum,
    required String contentTitle,
    required String contentSubtitle,
    required String buttonLabel,
    Function()? onTap,
    bool isHasActions = false,
    String? secondButtonLabel,
    Function()? secondActionOnTap,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return alertEnum.getAlert(
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
          isHasActions: isHasActions,
          secondButtonLabel: secondButtonLabel,
          secondActionOnTap: secondActionOnTap,
        );
      },
    );
  }
}