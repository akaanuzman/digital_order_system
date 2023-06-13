import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/products/models/service/customer/customer_model.dart';
import 'package:digital_order_system/products/models/service/food/reccomendation_foods_model.dart';
import 'package:digital_order_system/products/models/service/restaurant/restaurant_model.dart';
import 'package:digital_order_system/products/utility/base/base_firebase_model.dart';
import 'dart:developer';

import 'package:digital_order_system/products/utility/service/collections_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FireStoreService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<List<T>?> genericFetchCollection<T extends BaseFirebaseModel>({
    required T model,
    required CollectionsService collection,
    String? orderByField,
  }) async {
    try {
      CollectionReference<Map<String, dynamic>> reference =
          collection.reference;
      var response = orderByField != null
          ? await reference.orderBy(orderByField).get()
          : await reference.get();
      List<T> items = [];
      for (var item in response.docs) {
        T newModel = model.fromFirebase(item) ?? model;
        items.add(newModel);
      }
      return items;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<T?> genericFetchDocument<T extends BaseFirebaseModel>({
    required T model,
    required String docId,
    required CollectionsService collection,
  }) async {
    try {
      CollectionReference<Map<String, dynamic>> reference =
          collection.reference;
      var response = await reference.doc(docId).get();
      model = model.fromFirebase(response) ?? model;
      return model;
    } catch (e) {
      log(e.toString());
      await EasyLoading.dismiss();
      return null;
    }
  }

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
    required Map<String, dynamic> jsonData,
    required bool isCustomer,
  }) async {
    try {
      String docId = FirebaseAuth.instance.currentUser!.uid;
      if (isCustomer) {
        CollectionReference customers = CollectionsService.Customers.reference;
        await customers.doc(docId).update(jsonData);
      } else {
        CollectionReference restaurants =
            CollectionsService.Restaurants.reference;
        await restaurants.doc(docId).update(jsonData);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<CustomerModel?> getCustomerInfo({required String id}) async {
    CustomerModel? customerModel = CustomerModel();
    customerModel = await genericFetchDocument(
      model: customerModel,
      docId: id,
      collection: CollectionsService.Customers,
    );
    return customerModel;
  }

  Future<RestaurantModel?> getRestaurantInfo({required String id}) async {
    RestaurantModel? restaurantModel = RestaurantModel();
    restaurantModel = await genericFetchDocument(
      model: restaurantModel,
      docId: id,
      collection: CollectionsService.Restaurants,
    );
    return restaurantModel;
  }

  Future<List<ReccomendationFoodsModel>?> get getReccomendationFoods async {
    ReccomendationFoodsModel reccomendationFoodsModel =
        ReccomendationFoodsModel();
    List<ReccomendationFoodsModel>? foods =
        await genericFetchCollection<ReccomendationFoodsModel>(
      model: reccomendationFoodsModel,
      collection: CollectionsService.ReccomendationFoods,
      orderByField: 'foodName',
    );
    return foods;
  }
}
