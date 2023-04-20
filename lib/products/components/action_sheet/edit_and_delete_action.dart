import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

import '../../../_export_ui.dart';
import '../../theme/color/app_colors.dart';

@immutable
class EditAndDeleteAction {
  const EditAndDeleteAction._();

  static Future showEditAndDeleteAction({
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
                .copyWith(color: AppColors.instance.redSavinaPepper),
          ),
          onPressed: deleteOnTap ?? (context) {},
        ),
      ],
    );
  }
}
