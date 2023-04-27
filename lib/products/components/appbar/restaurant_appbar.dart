import 'package:digital_order_system/_export_ui.dart';

import '../../theme/color/app_colors.dart';

class RestaurantAppBar extends AppBar {
  RestaurantAppBar({
    super.key,
    required String title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
  }) : super(
          backgroundColor: AppColors.instance.redSavinaPepper,
          title: FadeInDown(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: actions,
          bottom: bottom,
        );
}
