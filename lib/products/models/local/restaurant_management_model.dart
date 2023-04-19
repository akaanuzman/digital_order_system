import 'package:flutter/material.dart';

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
  static final List<RestaurantManagementModel> managements = [
    RestaurantManagementModel(
      Icons.menu_book,
      "Mutfak Yönetimi",
      () {},
    ),
    RestaurantManagementModel(
      Icons.fastfood,
      "Yemek Yönetimi",
      () {},
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
