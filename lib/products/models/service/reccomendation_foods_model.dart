// ignore_for_file: must_be_immutable, overridden_fields

import 'package:equatable/equatable.dart';

import '../../utility/base/base_firebase_model.dart';

class ReccomendationFoodsModel extends Equatable
    with IdModel, BaseFirebaseModel<ReccomendationFoodsModel> {
  String? categoryId;
  String? categoryName;
  String? foodId;
  String? foodName;

  ReccomendationFoodsModel({
    this.categoryId,
    this.categoryName,
    this.foodId,
    this.foodName,
  });

  @override
  String? id = '';

  ReccomendationFoodsModel copyWith(
      {String? categoryId,
      String? categoryName,
      String? foodId,
      String? foodName}) {
    return ReccomendationFoodsModel(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'foodId': foodId,
      'foodName': foodName,
    };
  }

  @override
  ReccomendationFoodsModel fromJson(Map<String, dynamic> json) {
    return ReccomendationFoodsModel(
      categoryId: json['categoryId'] as String?,
      categoryName: json['categoryName'] as String?,
      foodId: json['foodId'] as String?,
      foodName: json['foodName'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        categoryId,
        categoryName,
        foodId,
        foodName,
      ];
}
