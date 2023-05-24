import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/products/models/service/customer_model.dart';
import 'package:digital_order_system/products/models/service/restaurant_model.dart';
import 'dart:developer';

import 'package:digital_order_system/products/utility/service/collections_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  Future updateUser({
    required Map<String, dynamic> userModel,
    required bool isCustomer,
  }) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    Map<String, dynamic> data = userModel;
    try {
      if (isCustomer) {
        CollectionReference customers = CollectionsService.Customers.reference;
        await customers.doc(uid).update(data);
      } else {
        CollectionReference restaurants =
            CollectionsService.Restaurants.reference;
        await restaurants.doc(uid).update(data);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<bool> hasUserDb({
    required String id,
    required bool isCustomer,
  }) async {
    try {
      var response = await firebaseFirestore
          .collection(isCustomer ? "Customers" : "Restaurants")
          .doc(id)
          .get();
      if (response.data() != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }

  Future<CustomerModel?> getCustomerInfo({required String id}) async {
    try {
      var response =
          await firebaseFirestore.collection("Customers").doc(id).get();
      CustomerModel customerModel = CustomerModel().fromFirebase(response);
      return customerModel;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<RestaurantModel?> getRestaurantInfoInfo({required String id}) async {
    try {
      var response =
          await firebaseFirestore.collection("Restaurants").doc(id).get();
      RestaurantModel restaurantModel =
          RestaurantModel().fromFirebase(response);
      return restaurantModel;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
