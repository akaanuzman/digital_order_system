import 'package:digital_order_system/features/common/navbar/model/navbar_model.dart';
import 'package:flutter/cupertino.dart';

extension NavbarModelExtension on NavbarModel {
  static List<NavbarModel> userNavbar = [
    NavbarModel(icon: CupertinoIcons.home),
    NavbarModel(icon: CupertinoIcons.heart),
    NavbarModel(icon: CupertinoIcons.person),
  ];
}
