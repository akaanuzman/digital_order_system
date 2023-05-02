import 'package:flutter/material.dart';

import '../components/alert/special_alert.dart';
import '../enums/alert_enum.dart';

extension AlertExtension on AlertEnum {
  SpecialAlert getAlert({
    required String contentTitle,
    required String contentSubtitle,
    required String buttonLabel,
    Function()? onTap,
    bool isHasActions = false,
    String? secondButtonLabel,
    Function()? secondActionOnTap,
  }) {
    switch (this) {
      case AlertEnum.SUCCESS:
        return SpecialAlert(
          icon: Icons.check,
          titleBgColor: Colors.greenAccent.shade400,
          circleAvatarBgColor: Colors.greenAccent.shade700,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.ERROR:
        return SpecialAlert(
          icon: Icons.do_disturb,
          titleBgColor: Colors.redAccent.shade400,
          circleAvatarBgColor: Colors.redAccent.shade700,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.WARN:
        return SpecialAlert(
          icon: Icons.error_outline_sharp,
          titleBgColor: Colors.amberAccent.shade400,
          circleAvatarBgColor: Colors.amberAccent.shade700,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.INFO:
        return SpecialAlert(
          icon: Icons.lightbulb,
          titleBgColor: Colors.yellowAccent.shade400,
          circleAvatarBgColor: Colors.yellowAccent.shade700,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
        );
      case AlertEnum.AREUSURE:
        return SpecialAlert(
          icon: Icons.done_outline_outlined,
          titleBgColor: Colors.tealAccent.shade400,
          circleAvatarBgColor: Colors.tealAccent.shade700,
          contentTitle: contentTitle,
          contentSubtitle: contentSubtitle,
          buttonLabel: buttonLabel,
          onTap: onTap,
          isHasActions: true,
          secondButtonLabel: secondButtonLabel,
          secondActionOnTap: secondActionOnTap,
        );
    }
  }
}
