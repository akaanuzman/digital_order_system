import 'package:digital_order_system/core/extensions/navbar_model_extension.dart';
import 'package:flutter/material.dart';
import '../model/navbar_model.dart';

class NavbarViewModel extends ChangeNotifier {
  int currentIndex = 0;

  final List<NavbarModel> _items = NavbarModelExtension.userNavbar;

  List<NavbarModel> get items => _items;

  final List<Widget> _views = [
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  List<Widget> get views => _views;

  void onItemTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}