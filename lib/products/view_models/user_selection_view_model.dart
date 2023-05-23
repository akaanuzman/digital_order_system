import '../../_export_ui.dart';

class UserSelectionViewModel extends ChangeNotifier with BaseSingleton {
  bool isCustomer = false;

  void get chooseCustomer {
    isCustomer = true;
  }

  void get chooseRestaurant {
    isCustomer = false;
  }
}
