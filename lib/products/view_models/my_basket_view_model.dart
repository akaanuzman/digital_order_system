import 'package:flutter/material.dart';

class MyBasketViewModel extends ChangeNotifier {
  int counter = 0;
  String title = "0";

  void get increaseCounter {
    counter++;
    print(counter);
    notifyListeners();
  }

  void get decreaseCounter {
    if (counter > 0) {
      counter--;
      notifyListeners();
    }
    print(counter);
  }
}
