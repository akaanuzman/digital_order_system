import 'package:flutter/material.dart';

class CustomerBasketViewModel extends ChangeNotifier {
  int counter = 0;
  String title = "0";

  void get increaseCounter {
    counter++;
    notifyListeners();
  }

  void get decreaseCounter {
    if (counter > 0) {
      counter--;
      notifyListeners();
    }
  }
}
