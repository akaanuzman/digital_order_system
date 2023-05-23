import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

import 'package:digital_order_system/products/utility/service/collections_service.dart';

class FireStoreService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future signUp({
    required Map<String, dynamic> userModel,
    required String uid,
    required bool isCustomer,
  }) async {
    Map<String, dynamic> data = userModel;
    try {
      if (isCustomer) {
        CollectionReference customers = CollectionsService.Customers.reference;
        await customers.doc(uid).set(data);
      } else {
        CollectionReference restaurants =
            CollectionsService.Restaurants.reference;
        await restaurants.doc(uid).set(data);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
