import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseFirebaseModel<T> {
  T fromJson(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Map<String, dynamic>? response = snapshot.data();
    if (response != null) {
      return fromJson(response);
    }
    return null;
  }
}
