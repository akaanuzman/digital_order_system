import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/row/row_icon_text.dart';

import '../../theme/color/app_colors.dart';

class RowIconTextForOrderAndUserInformation extends RowIconText {
  RowIconTextForOrderAndUserInformation({
    super.key,
    required BuildContext context,
    required IconData icon,
    required String text,
  }) : super(
          icon: icon,
          text: text,
          iconColor: AppColors.instance.scropion,
          iconSize: context.val4x,
          textStyle: context.textTheme.titleMedium!
              .copyWith(color: AppColors.instance.scropion),
        );

  RowIconTextForOrderAndUserInformation.money({
    super.key,
    required BuildContext context,
    required String text,
  }) : super(
          icon: Icons.attach_money,
          text: text,
          iconColor: AppColors.instance.scropion,
          iconSize: context.val4x,
          textStyle: context.textTheme.titleMedium!
              .copyWith(color: AppColors.instance.scropion),
        );

  RowIconTextForOrderAndUserInformation.basket({
    super.key,
    required BuildContext context,
    required String text,
  }) : super(
          icon: Icons.shopping_bag_outlined,
          text: text,
          iconColor: AppColors.instance.scropion,
          iconSize: context.val4x,
          textStyle: context.textTheme.titleMedium!
              .copyWith(color: AppColors.instance.scropion),
        );
}
