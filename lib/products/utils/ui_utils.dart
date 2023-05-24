import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:intl/intl.dart';

import '../../_export_ui.dart';
import '../theme/_export_theme.dart';
import '../extensions/alert_extension.dart';
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
            isFail ? colors.redSavinaPepper : colors.successSnackbarColor,
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

  Future<void> showAlertDialog({
    required BuildContext context,
    required AlertEnum alertEnum,
    required String contentTitle,
    required String contentSubtitle,
    required String buttonLabel,
    Function()? onTap,
    bool isHasActions = false,
    bool barrierDismissible = false,
    String? secondButtonLabel,
    Function()? secondActionOnTap,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
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

  Future showEditAndDeleteAction({
    required BuildContext context,
    void Function(BuildContext)? editOnTap,
    void Function(BuildContext)? deleteOnTap,
  }) {
    return showAdaptiveActionSheet(
      context: context,
      actions: [
        BottomSheetAction(
          title: Text(
            "Düzenle",
            style:
                context.textTheme.headlineSmall!.copyWith(color: Colors.blue),
          ),
          onPressed: editOnTap ?? (context) {},
        ),
        BottomSheetAction(
          title: Text(
            "Sil",
            style: context.textTheme.headlineSmall!
                .copyWith(color: colors.redSavinaPepper),
          ),
          onPressed: deleteOnTap ?? (context) {},
        ),
      ],
      cancelAction: CancelAction(
        title: Text(
          'İptal',
          style: context.textTheme.headlineSmall!
              .copyWith(color: colors.redSavinaPepper),
        ),
      ),
    );
  }


}
