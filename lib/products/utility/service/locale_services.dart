import 'package:get_storage/get_storage.dart';

class LocaleServices {
  final box = GetStorage();

  void saveOnboard(bool isOnboard) {
    box.write("openOnboard", isOnboard);
  }

  Future<bool> readOnboard() async {
    final bool result = await box.read("openOnboard");
    return result;
  }

  void saveAccount(Map<String,dynamic> user) {
    box.write("account", user);
  }

  Future<Map<String,dynamic>?> readAccount() async {
    final Map<String,dynamic>? result = await box.read("account");
    return result;
  }
}
