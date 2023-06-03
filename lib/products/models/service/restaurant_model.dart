// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_order_system/products/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class RestaurantModel extends Equatable
    with BaseFirebaseModel<RestaurantModel> {
  String? restaurantId;
  Timestamp? createdDate;
  String? companyName;
  String? companyMail;
  String? companyNumber;
  String? openingTime;
  String? closingTime;
  bool? isActive;
  String? location;
  String? locationName;
  String? imageUrl;
  String? imageStoragePath;
  List<String>? fcmToken;

  RestaurantModel({
    this.restaurantId,
    this.createdDate,
    this.companyName,
    this.companyMail,
    this.companyNumber,
    this.openingTime,
    this.closingTime,
    this.isActive,
    this.location,
    this.locationName,
    this.imageUrl,
    this.imageStoragePath,
    this.fcmToken,
  });

  @override
  List<Object?> get props => [
        restaurantId,
        createdDate,
        companyName,
        companyMail,
        companyNumber,
        openingTime,
        closingTime,
        isActive,
        location,
        locationName,
        imageUrl,
        imageStoragePath,
        fcmToken
      ];

  RestaurantModel copyWith({
    String? restaurantId,
    Timestamp? createdDate,
    String? companyName,
    String? companyMail,
    String? companyNumber,
    String? openingTime,
    String? closingTime,
    String? email,
    String? password,
    bool? isActive,
    String? location,
    String? locationName,
    String? imageUrl,
    String? imageStoragePath,
    List<String>? fcmToken,
  }) {
    return RestaurantModel(
      restaurantId: restaurantId ?? this.restaurantId,
      createdDate: createdDate ?? this.createdDate,
      companyName: companyName ?? this.companyName,
      companyMail: companyMail ?? this.companyMail,
      companyNumber: companyNumber ?? this.companyNumber,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      isActive: isActive ?? this.isActive,
      location: location ?? this.location,
      locationName: locationName ?? this.locationName,
      imageUrl: imageUrl ?? this.imageUrl,
      imageStoragePath: imageStoragePath ?? this.imageStoragePath,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'restaurantId': restaurantId,
      'createdDate': createdDate,
      'companyName': companyName,
      'companyMail': companyMail,
      'companyNumber': companyNumber,
      'openingTime': openingTime,
      'closingTime': closingTime,
      'isActive': isActive,
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
  RestaurantModel fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      restaurantId: json['restaurantId'] as String?,
      createdDate: json['createdDate'] as Timestamp?,
      companyName: json['companyName'] as String?,
      companyMail: json['companyMail'] as String?,
      companyNumber: json['companyNumber'] as String?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      isActive: json['isActive'] as bool?,
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
