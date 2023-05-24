// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

enum CollectionsService {
  Restaurants,
  Customers,
  Version;

  CollectionReference get reference =>
      FirebaseFirestore.instance.collection(name);  
}
