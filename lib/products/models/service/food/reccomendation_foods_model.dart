// ignore_for_file: must_be_immutable, overridden_fields

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../utility/base/base_firebase_model.dart';
part 'reccomendation_foods_model.g.dart';

@JsonSerializable()
class ReccomendationFoodsModel extends Equatable
    with BaseFirebaseModel<ReccomendationFoodsModel> {
  String? categoryId;
  String? categoryName;
  String? foodId;
  String? foodName;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isSelectedDTO;

  ReccomendationFoodsModel({
    this.categoryId,
    this.categoryName,
    this.foodId,
    this.foodName,
    this.isSelectedDTO = false,
  });

  ReccomendationFoodsModel copyWith({
    String? categoryId,
    String? categoryName,
    String? foodId,
    String? foodName,
    bool isSelectedDTO = false,
  }) {
    return ReccomendationFoodsModel(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        foodId: foodId ?? this.foodId,
        foodName: foodName ?? this.foodName,
        isSelectedDTO: isSelectedDTO);
  }

  Map<String, dynamic> toJson() => _$ReccomendationFoodsModelToJson(this);

  @override
  ReccomendationFoodsModel fromJson(Map<String, dynamic> json) =>
      _$ReccomendationFoodsModelFromJson(json);

  @override
  List<Object?> get props => [
        categoryId,
        categoryName,
        foodId,
        foodName,
      ];
}
