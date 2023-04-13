import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/theme/_export_theme.dart';

import '../extensions/alert_extension.dart';
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

  AppColors get colors => AppColors.instance;

  Divider get divider => const Divider(
        thickness: 1.5,
      );

  showSnackbar({
    required BuildContext context,
    required String text,
    bool isFail = false,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1200),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            isFail ? colors.failureSnackbarColor : colors.successSnackbarColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        content: SizedBox(
          height: 18,
          child: Center(
            child: Text(
              text,
              style: context.textTheme.labelMedium!.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ),
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
