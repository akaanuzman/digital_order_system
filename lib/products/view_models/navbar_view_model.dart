import '../base/base_singleton.dart';
import 'package:flutter/material.dart';
import '../models/local/navbar_model.dart';

class NavbarViewModel extends ChangeNotifier with BaseSingleton {
  int currentIndex = 0;

  List<NavbarModel> items(bool isUser) => isUser
      ? NavbarModelExtension.userNavbar
      : NavbarModelExtension.restaurantNavbar;

  List<Widget> views(bool isUser) {
    return isUser ? constants.userNavbarViews : constants.restaurantNavbarViews;
  }

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
