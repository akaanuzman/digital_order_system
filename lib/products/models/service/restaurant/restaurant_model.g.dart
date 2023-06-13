// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      restaurantId: json['restaurantId'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
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

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'createdDate': instance.createdDate?.toIso8601String(),
      'companyName': instance.companyName,
      'companyMail': instance.companyMail,
      'companyNumber': instance.companyNumber,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'isActive': instance.isActive,
      'location': instance.location,
      'locationName': instance.locationName,
      'imageUrl': instance.imageUrl,
      'imageStoragePath': instance.imageStoragePath,
      'fcmToken': instance.fcmToken,
    };
