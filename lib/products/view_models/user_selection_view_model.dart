import '../../_export_ui.dart';

class UserSelectionViewModel extends ChangeNotifier with BaseSingleton {
  bool isUser = false;

  void get chooseUser {
    isUser = true;
  }

  void get chooseRestaurant {
    isUser = false;
  }
}
