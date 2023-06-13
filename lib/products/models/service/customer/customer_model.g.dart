// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) =>
    CustomerModel(
      customerId: json['customerId'] as String?,
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
      mail: json['mail'] as String?,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as bool?,
      isActive: json['isActive'] as bool?,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      age: json['age'] as int?,
      location: json['location'] as String?,
      locationName: json['locationName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      imageStoragePath: json['imageStoragePath'] as String?,
      fcmToken: (json['fcmToken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CustomerModelToJson(CustomerModel instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'createdDate': instance.createdDate?.toIso8601String(),
      'mail': instance.mail,
      'name': instance.name,
      'surname': instance.surname,
      'fullName': instance.fullName,
      'phone': instance.phone,
      'gender': instance.gender,
      'isActive': instance.isActive,
      'birthDate': instance.birthDate?.toIso8601String(),
      'age': instance.age,
      'location': instance.location,
      'locationName': instance.locationName,
      'imageUrl': instance.imageUrl,
      'imageStoragePath': instance.imageStoragePath,
      'fcmToken': instance.fcmToken,
    };
