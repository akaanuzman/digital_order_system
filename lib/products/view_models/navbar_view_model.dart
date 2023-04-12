import 'package:flutter/material.dart';
import '../models/local/navbar_model.dart';

class NavbarViewModel extends ChangeNotifier {
  int currentIndex = 0;

  List<NavbarModel> items(bool isUser) => isUser
      ? NavbarModelExtension.userNavbar
      : NavbarModelExtension.restaurantNavbar;

  final List<Widget> _views = [
    const Scaffold(
      body: Center(
        child: Text("Home Screen"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Fav Screen"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("Profile Screen"),
      ),
    ),
  ];

  List<Widget> get views => _views;

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
