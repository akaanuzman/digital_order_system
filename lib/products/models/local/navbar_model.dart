import 'package:flutter/cupertino.dart';

class NavbarModel extends BottomNavigationBarItem {
  NavbarModel({
    Key? key,
    required IconData icon,
  }) : super(
          icon: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Icon(icon),
          ),
          label: "",
        );
}

extension NavbarModelExtension on NavbarModel {
  static List<NavbarModel> userNavbar = [
    NavbarModel(icon: CupertinoIcons.home),
    NavbarModel(icon: CupertinoIcons.heart),
    NavbarModel(icon: CupertinoIcons.person),
  ];

  static List<NavbarModel> restaurantNavbar = [
    NavbarModel(icon: CupertinoIcons.home),
    NavbarModel(icon: CupertinoIcons.shopping_cart),
    NavbarModel(icon: CupertinoIcons.person),
  ];
}
