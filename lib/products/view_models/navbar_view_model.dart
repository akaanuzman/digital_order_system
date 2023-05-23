import '../utility/base/base_singleton.dart';
import 'package:flutter/material.dart';
import '../models/local/navbar_model.dart';

class NavbarViewModel extends ChangeNotifier with BaseSingleton {
  int currentIndex = 0;

  List<NavbarModel> items(bool isCustomer) => isCustomer
      ? NavbarModelExtension.userNavbar
      : NavbarModelExtension.restaurantNavbar;

  List<Widget> views(bool isCustomer) {
    return isCustomer ? constants.userNavbarViews : constants.restaurantNavbarViews;
  }

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
