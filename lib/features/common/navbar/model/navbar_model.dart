import 'package:flutter/material.dart';

class NavbarModel extends BottomNavigationBarItem {
  NavbarModel({
    Key? key,
    required IconData icon,
  }) : super(
          icon: Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Icon(icon),
          ),
          label: "",
        );
}
