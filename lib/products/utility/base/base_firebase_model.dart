import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/products/utility/exception/firebase_custom_exception.dart';

abstract class IdModel {
  String? id;
}

abstract class BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Map<String, dynamic>? response = snapshot.data();
    if (response == null) {
      throw FirebaseCustomException('$snapshot data is null!');
    }
    //TODO: fix later
    response.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(response);
  }
}
