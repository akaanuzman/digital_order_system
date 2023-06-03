// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionsService {
  Restaurants,
  Customers,
  Version,
  ReccomendationFoods;

  CollectionReference<Map<String, dynamic>> get reference =>
      FirebaseFirestore.instance.collection(name);
}
