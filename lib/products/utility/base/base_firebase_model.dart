import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IdModel {
  String? id;
}

abstract class BaseFirebaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final Map<String, dynamic>? response = snapshot.data();
    if (response == null) {
      return null;
    }
    //TODO: fix later
    response.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(response);
  }
}
