import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/models/service/restaurant/restaurant_model.dart';

import '../utility/service/firestore_service.dart';

class RestaurantViewModel extends ChangeNotifier {
    RestaurantModel currentRestaurant = RestaurantModel();

  Future getRestaurantInformation(String uid) async {
    currentRestaurant =
        await FireStoreService().getRestaurantInfo(id: uid) ?? RestaurantModel();
    notifyListeners();
  }
}