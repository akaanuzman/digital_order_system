// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reccomendation_foods_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReccomendationFoodsModel _$ReccomendationFoodsModelFromJson(
        Map<String, dynamic> json) =>
    ReccomendationFoodsModel(
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      foodId: json['foodId'] as String?,
      foodName: json['foodName'] as String?,
    );

Map<String, dynamic> _$ReccomendationFoodsModelToJson(
        ReccomendationFoodsModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'foodId': instance.foodId,
      'foodName': instance.foodName,
    };
