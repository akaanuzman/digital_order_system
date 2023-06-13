// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/products/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'customer_model.g.dart';

@JsonSerializable()
class CustomerModel extends Equatable with BaseFirebaseModel<CustomerModel> {
  String? customerId;
  DateTime? createdDate;
  String? mail;
  String? name;
  String? surname;
  String? fullName;
  String? phone;
  bool? gender;
  bool? isActive;
  DateTime? birthDate;
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
    this.gender,
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
        gender,
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
    DateTime? createdDate,
    String? mail,
    String? name,
    String? surname,
    String? fullName,
    String? phone,
    bool? gender,
    bool? isActive,
    DateTime? birthDate,
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
      gender: gender ?? this.gender,
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
    Map<String, dynamic> json = _$CustomerModelToJson(this);
    json.removeWhere((key, value) => value == null);
    return json;
  }

  @override
  CustomerModel fromJson(Map<String, dynamic> json) =>
      _$CustomerModelFromJson(json);
}
