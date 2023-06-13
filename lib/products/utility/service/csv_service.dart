import 'package:csv/csv.dart';
import 'package:digital_order_system/_export_ui.dart';
import 'package:digital_order_system/products/constants/path_constants.dart';
import 'package:digital_order_system/products/models/local/reccomendation_model.dart';
import 'package:flutter/services.dart' show rootBundle;

@immutable
class CsvService {
  const CsvService._();

  static Future<List<ReccomendationModel>> loadCsvDataset() async {
    final String rawData =
        await rootBundle.loadString(PathConstants.dataset.toCsv);

    List<List<dynamic>> listData = const CsvToListConverter().convert(rawData);
    List<ReccomendationModel> dataset = _groupDatasetIntoFour(listData: listData);

    return dataset;
  }

  static List<ReccomendationModel> _groupDatasetIntoFour(
      {required List<List<dynamic>> listData}) {
    List<ReccomendationModel> items = [];
    int counter = 0;
    String populationGroup = "";
    String food = "";
    String gender = "";
    String preferenceCount = "";
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
    return items;
  }
}
