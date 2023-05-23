// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/products/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable
    with IdModel, BaseFirebaseModel<CustomerModel> {
  String? customerId;
  Timestamp? createdDate;
  String? mail;
  String? name;
  String? surname;
  String? fullName;
  String? phone;
  bool? isActive;
  Timestamp? birthDate;
  int? age;
  String? location;
  String? locationName;
  String? imageUrl;
  String? imageStoragePath;
  List<String>? fcmToken;

  CustomerModel({
    this.customerId,
    this.createdDate,
    this.mail,
    this.name,
    this.surname,
    this.fullName,
    this.phone,
    this.isActive,
    this.birthDate,
    this.age,
    this.location,
    this.locationName,
    this.imageUrl,
    this.imageStoragePath,
    this.fcmToken,
  });

  @override
  List<Object?> get props => [
        customerId,
        createdDate,
        mail,
        name,
        surname,
        fullName,
        phone,
        isActive,
        birthDate,
        age,
        location,
        locationName,
        imageUrl,
        imageStoragePath,
        fcmToken
      ];

  CustomerModel copyWith({
  String? customerId,
  Timestamp? createdDate,
  String? mail,
  String? name,
  String? surname,
  String? fullName,
  String? phone,
  bool? isActive,
  Timestamp? birthDate,
  int? age,
  String? location,
  String? locationName,
  String? imageUrl,
  String? imageStoragePath,
  List<String>? fcmToken,
  }) {
    return CustomerModel(
      customerId: customerId ?? this.customerId,
      createdDate: createdDate ?? this.createdDate,
      mail: mail ?? this.mail,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      isActive: isActive ?? this.isActive,
      birthDate: birthDate ?? this.birthDate,
      age: age ?? this.age,
      location: location ?? this.location,
      locationName: locationName ?? this.locationName,
      imageUrl: imageUrl ?? this.imageUrl,
      imageStoragePath: imageStoragePath ?? this.imageStoragePath,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> json = {
      'customerId': customerId,
      'createdDate': createdDate,
      'mail': mail,
      'name': name,
      'surname': surname,
      'fullName': fullName,
      'phone': phone,
      'isActive': isActive,
      'birthDate': birthDate,
      'age': age,
      'location': location,
      'locationName': locationName,
      'imageUrl': imageUrl,
      'imageStoragePath': imageStoragePath,
      'fcmToken': fcmToken,
    };
    json.removeWhere((key, value) => value == null);
    return json;
  }

  @override
  CustomerModel fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      customerId: json['customerId'] as String?,
      createdDate: json['createdDate'] as Timestamp?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      isActive: json['isActive'] as bool?,
      birthDate: json['birthDate'] as Timestamp?,
      age: json['age'] as int?,
      location: json['location'] as String?,
      locationName: json['locationName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      imageStoragePath: json['imageStoragePath'] as String?,
      fcmToken: (json['fcmToken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }
}
