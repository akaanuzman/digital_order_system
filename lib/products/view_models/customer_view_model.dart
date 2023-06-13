import 'package:digital_order_system/products/models/service/customer/customer_model.dart';
import 'package:flutter/material.dart';

import '../utility/service/firestore_service.dart';

class CustomerViewModel extends ChangeNotifier {
  CustomerModel currentCustomer = CustomerModel();

  Future getCustomerInformation(String uid) async {
    currentCustomer =
        await FireStoreService().getCustomerInfo(id: uid) ?? CustomerModel();
    notifyListeners();
  }
}
