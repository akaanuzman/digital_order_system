import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/components/row/row_icon_text.dart';

class FoodReccomendationPersonelInfo extends RowIconText {
  FoodReccomendationPersonelInfo({
    super.key,
    required IconData icon,
    required String text,
  }) : super(
          icon: icon,
          text: text,
          textStyle: NavigationService
              .navigatorKey.currentContext!.textTheme.titleSmall,
          sizedWidthBox: NavigationService
              .navigatorKey.currentContext!.emptySizedWidthBox3x,
        );
}
