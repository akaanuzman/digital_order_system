import 'package:get_storage/get_storage.dart';

class LocaleServices {
  final _box = GetStorage();

  void saveOnboard(bool isOnboard) {
    _box.write("openOnboard", isOnboard);
  }

  Future<bool> readOnboard() async {
    final bool result = await _box.read("openOnboard");
    return result;
  }

  void saveAccount(String id) {
    _box.write("account", id);
  }

  Future<String?> readAccount() async {
    final String? result = _box.read("account");
    return result;
  }

  void saveIsCustomer(bool isCustomer) {
    _box.write("isCustomer", isCustomer);
  }

  Future<bool> readIsCustomer() async {
    final bool result = _box.read("isCustomer");
    return result;
  }

  void saveProfileComplate(bool isComplate) {
    _box.write("isComplate", isComplate);
  }

  Future<bool> readIsComplate() async {
    final bool result = _box.read("isComplate");
    return result;
  }
}
