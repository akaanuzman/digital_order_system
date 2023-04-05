import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SplashViewModel extends ChangeNotifier {
  final box = GetStorage();

  Future<bool> get initPage async {
    final result = await box.read("openOnboard");
    return result;
  }
}
