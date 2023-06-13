// ignore_for_file: must_be_immutable

import 'package:digital_order_system/products/utility/base/base_firebase_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel extends Equatable
    with BaseFirebaseModel<RestaurantModel> {
  String? restaurantId;
  DateTime? createdDate;
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
    DateTime? createdDate,
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
    Map<String, dynamic> json = _$RestaurantModelToJson(this);
    json.removeWhere((key, value) => value == null);
    return json;
  }

  @override
  RestaurantModel fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
