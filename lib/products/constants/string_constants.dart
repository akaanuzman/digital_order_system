class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance {
    if (_instance != null) {
      return _instance!;
    } else {
      _instance = StringConstants.init();
      return _instance!;
    }
  }

  StringConstants.init();

  final loginEmailHintText = "example@gmail.com";
  final loginPasswordHintText = "******";
}
