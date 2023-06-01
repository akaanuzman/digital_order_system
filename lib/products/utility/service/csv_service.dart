import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:digital_order_system/products/models/local/reccomendation_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class CsvService {
  Future<List<ReccomendationModel>> loadCsvDataset() async {
    final String rawData = await rootBundle
        .loadString("assets/dataset/food_recommendation_dataset.csv");
    List<ReccomendationModel> items = [];
    int counter = 0;
    String populationGroup = "";
    String food = "";
    String gender = "";
    String preferenceCount = "";
    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    for (var list in listData) {
      for (var item in list) {
        if (counter < 4) {
          counter == 0
              ? populationGroup = item
              : counter == 1
                  ? food = item
                  : counter == 2
                      ? gender = item
                      : preferenceCount = item;
          counter++;
        } else if (counter == 4) {
          items.add(
            ReccomendationModel(
              populationGroup: populationGroup.trim(),
              food: food.trim(),
              gender: gender.trim(),
              preferenceCount: int.parse(preferenceCount),
            ),
          );
          counter = 0;
          populationGroup = item;
          counter++;
        }
      }
    }
    // for (var element in items) {
    //   log("${element.populationGroup} ${element.food} ${element.gender} ${element.preferenceCount}");
    // }
    // log(items.length.toString());
    return items;
  }
}
