import 'package:flutter/material.dart';
import '../models/local/navbar_model.dart';

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