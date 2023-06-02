// ignore_for_file: depend_on_referenced_packages
import 'dart:io';

import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:digital_order_system/products/models/local/reccomendation_model.dart';
import 'package:digital_order_system/products/utility/base/base_singleton.dart';
import 'package:digital_order_system/products/utility/service/csv_service.dart';
import 'package:digital_order_system/products/utils/food_reccomendation_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import '../utility/service/file_service.dart';

class FoodReccomendationViewModel extends ChangeNotifier with BaseSingleton {
  late String? response;
  List ageResults = [];
  List genderResults = [];
  bool isComplateRecommendation = false;
  List<ReccomendationModel> dataset = [];
  FoodReccomendationUtils foodReccomendationUtils = FoodReccomendationUtils();
  int selectedFavFoodIndex = 3;

  Future loadAIModelFromAsset() async {
    await loadModel();
  }

  Future loadModel({bool isAgeModel = true}) async {
    Tflite.close();
    response = await Tflite.loadModel(
      model: isAgeModel
          ? "assets/ai/age_model.tflite"
          : "assets/ai/gender_model.tflite",
      labels: isAgeModel
          ? "assets/ai/age_labels.txt"
          : "assets/ai/gender_labels.txt",
      numThreads: 2,
    );
    log(isAgeModel
        ? "Age model loaded: $response"
        : "Gender model loaded: $response");
  }

  Future disposeModel() async {
    Tflite.close();
  }

  Future imageClassification(String imageUrl) async {
    await EasyLoading.show(
      maskType: EasyLoadingMaskType.black,
    );
    await estimation(imageUrl: imageUrl);
    if (ageResults.isNotEmpty) {
      await disposeModel();
      await loadModel(isAgeModel: false);
      await estimation(
        imageUrl: imageUrl,
        isAgeEstimation: false,
      );
      if (genderResults.isNotEmpty) {
        dataset = await CsvService().loadCsvDataset();
        reccomendation();
        isComplateRecommendation = true;
        notifyListeners();
      }
    }
    await EasyLoading.dismiss();
    uiUtils.showSnackbar(
      context: NavigationService.navigatorKey.currentContext!,
      text: "Önerme başarıyla tamamlandı!",
    );
  }

  Future estimation({
    required String imageUrl,
    bool isAgeEstimation = true,
  }) async {
    File file = await FileService().fileFromImageUrl(imageUrl);
    log(file.path);
    try {
      var recognitions = await Tflite.runModelOnImage(
        path: file.path,
        imageMean: 128,
        imageStd: 128,
      );
      isAgeEstimation
          ? ageResults = recognitions ?? []
          : genderResults = recognitions ?? [];
      log(isAgeEstimation
          ? "Age Results is: $ageResults"
          : "Gender Results is: $genderResults");
      log(isAgeEstimation
          ? "Age Recognitions is: $recognitions"
          : "Gender Recognitions is: $recognitions");
    } catch (e) {
      log(e.toString());
      await EasyLoading.dismiss();
      uiUtils.showSnackbar(
        context: NavigationService.navigatorKey.currentContext!,
        text: "Bir hata oluştu!",
        isFail: true,
      );
    }
  }

  void reccomendation() {
    String ageLabel = ageResults.first['label'];
    String genderLabel = genderResults.first['label'];

    if (ageLabel == 'baby') {
      if (genderLabel == 'male') {
        filterReccomendation('Baby', 'Male');
      } else if (genderLabel == 'female') {
        filterReccomendation('Baby', 'Female');
      }
    } else if (ageLabel == 'child') {
      if (genderLabel == 'male') {
        filterReccomendation('Child', 'Male');
      } else if (genderLabel == 'female') {
        filterReccomendation('Child', 'Female');
      }
    } else if (ageLabel == 'youth') {
      if (genderLabel == 'male') {
        filterReccomendation('Youth', 'Male');
      } else if (genderLabel == 'female') {
        filterReccomendation('Youth', 'Female');
      }
    } else if (ageLabel == 'adult') {
      if (genderLabel == 'male') {
        filterReccomendation('Adult', 'Male');
      } else if (genderLabel == 'female') {
        filterReccomendation('Adult', 'Female');
      }
    } else if (ageLabel == 'old') {
      if (genderLabel == 'male') {
        filterReccomendation('Old', 'Male');
      } else if (genderLabel == 'female') {
        filterReccomendation('Old', 'Female');
      }
    }
  }

  void filterReccomendation(String ageGroup, String gender) {
    List<ReccomendationModel> filteredModel = dataset;
    filteredModel = filteredModel
        .where((e) => e.populationGroup == ageGroup && e.gender == gender)
        .toList();
    filteredModel.sort(
      (a, b) => b.preferenceCount.compareTo(
        a.preferenceCount,
      ),
    );
    List<ReccomendationModel> getModelCategory = [];
    for (var i = 0; i < selectedFavFoodIndex; i++) {
      getModelCategory.add(filteredModel[i]);
      log("${getModelCategory[i].populationGroup} ${getModelCategory[i].food} ${getModelCategory[i].gender} ${getModelCategory[i].preferenceCount}");
    }
  }

  String getAgeEstimation({bool isGroup = false}) {
    return foodReccomendationUtils.getAgeEstimation(
      ageResults: ageResults,
      isGroup: isGroup,
    );
  }

  String get getGenderEstimation {
    return foodReccomendationUtils.getGenderEstimation(
      genderResults: genderResults,
    );
  }

  bool get isGender {
    return foodReccomendationUtils.isGender(
      genderResults: genderResults,
    );
  }

  String getConfidence({bool isAgeEstimation = true}) {
    return foodReccomendationUtils.getConfidence(
      ageResults: ageResults,
      genderResults: genderResults,
      isAgeEstimation: isAgeEstimation,
    );
  }
}
