import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:digital_order_system/views/home/food/restaurant_food_view.dart';
import 'package:flutter/material.dart';

import '../../../views/home/kitchen/restaurant_kitchen_view.dart';

class RestaurantManagementModel {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  RestaurantManagementModel(
    this.icon,
    this.title,
    this.onTap,
  );
}

extension RestaurantManagementModelExtension on RestaurantManagementModel {
  static List<RestaurantManagementModel> managements = [
    RestaurantManagementModel(
      Icons.menu_book,
      "Mutfak Yönetimi",
      () {
        Navigator.push(
          NavigationService.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const RestaurantKitchenView(),
          ),
        );
      },
    ),
    RestaurantManagementModel(
      Icons.fastfood,
      "Yemek Yönetimi",
      () {
        Navigator.push(
          NavigationService.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => const RestaurnatFoodView(),
          ),
        );
      },
    ),
    RestaurantManagementModel(
      Icons.local_cafe,
      "İçecek Yönetimi",
      () {},
    ),
    RestaurantManagementModel(
      Icons.attach_money,
      "Gelir Yönetimi",
      () {},
    ),
  ];
}
