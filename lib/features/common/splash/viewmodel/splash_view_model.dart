import 'package:flutter/material.dart';

import '../../../../core/helpers/storage.dart';

class SplashViewModel extends ChangeNotifier {
  bool _status = false;
  bool get status => _status;

  Future<bool> get initPage async {
    final result = await Storage().readStorage("openOnboard");
    if (result != null) {
      _status = true;
      return status;
    } else {
      return status;
    }
  }
}
