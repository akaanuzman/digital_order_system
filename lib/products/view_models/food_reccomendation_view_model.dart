// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously
import 'dart:io';

import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:digital_order_system/products/constants/_export_constants.dart';
import 'package:digital_order_system/products/models/local/reccomendation_model.dart';
import 'package:digital_order_system/products/models/service/food/reccomendation_foods_model.dart';
import 'package:digital_order_system/products/utility/base/base_singleton.dart';
import 'package:digital_order_system/products/utility/service/csv_service.dart';
import 'package:digital_order_system/products/utils/food_reccomendation_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import '../utility/service/file_service.dart';
import '../utility/service/firestore_service.dart';

class FoodReccomendationViewModel extends ChangeNotifier with BaseSingleton {
  late String? response;
  List ageResults = [];
  List genderResults = [];
  bool isComplateRecommendation = false;
  List<ReccomendationModel> dataset = [];
  List<ReccomendationFoodsModel> reccomendationFoods = [];
  List<ReccomendationFoodsModel> searchReccomendationFoodsList = [];
  List<ReccomendationFoodsModel> selectedReccomendationFood = [];
  List<String> selectedFavFoods = [];
  List<String> suggestions = [];
  TextEditingController searchController = TextEditingController();
  int selectedFavFoodIndex = 0;
  double matchRate = 0;

  Future get getReccomendationFoods async {
    reccomendationFoods = await FireStoreService().getReccomendationFoods ?? [];
  }

  void searchReccomendationFoods(String query) {
    if (query.isNotEmpty) {
      final suggestions = reccomendationFoods.where((foods) {
        final String foodName = foods.foodName?.toLowerCase() ?? "";
        final String categoryName = foods.categoryName?.toLowerCase() ?? "";
        final String input = query.toLowerCase();
        return foodName.contains(input) || categoryName.contains(input);
      }).toList();
      searchReccomendationFoodsList = suggestions;
    }
    notifyListeners();
  }

  void selectReccomendationFood(ReccomendationFoodsModel food) {
    food.isSelectedDTO = !food.isSelectedDTO;
    if (food.isSelectedDTO) {
      selectedReccomendationFood.add(food);
      selectedFavFoods.add(food.foodName ?? "");
    } else {
      selectedReccomendationFood.remove(food);
      selectedFavFoods.remove(food.foodName ?? "");
    }
    for (var element in selectedReccomendationFood) {
      log(element.foodName ?? "");
      log("******");
    }
    notifyListeners();
  }

  void get chooseReccomendationFoodsValidator {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    if (selectedReccomendationFood.isEmpty) {
      uiUtils.showSnackbar(
        context: context,
        text: "Lütfen en az 1 adet yemek seçiniz.",
        isFail: true,
      );
    } else if (selectedReccomendationFood.length >= 4) {
      uiUtils.showSnackbar(
        context: context,
        text: "Maksimum 3 adet yemek seçebilirsiniz.",
        isFail: true,
      );
    } else {
      selectedFavFoodIndex = selectedReccomendationFood.length;
      Navigator.pop(context);
      searchReccomendationFoodsList = [];
      searchController.clear();
      uiUtils.showSnackbar(
        context: context,
        text: "Değişiklikler kaydedildi",
      );
    }
  }

  Future loadAIModelFromAsset() async {
    await loadModel();
  }

  Future loadModel({bool isAgeModel = true}) async {
    Tflite.close();
    response = await Tflite.loadModel(
      model: isAgeModel
          ? PathConstants.ageModel.toTflite
          : PathConstants.genderModel.toTflite,
      labels: isAgeModel
          ? PathConstants.ageLabels.toLabels
          : PathConstants.genderLabels.toLabels,
      numThreads: 2,
    );
    String logMessage = isAgeModel
        ? "Age model loaded: $response"
        : "Gender model loaded: $response";
    log(logMessage);
  }

  Future disposeModel() async {
    Tflite.close();
  }

  Future imageClassification(String imageUrl) async {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    if (selectedFavFoodIndex == 0) {
      uiUtils.showSnackbar(
        context: context,
        text: "Lütfen önce favori yemeğinizi seçin!",
        isFail: true,
      );
      return;
    }
    if (imageUrl == "") {
      uiUtils.showSnackbar(
        context: context,
        text: "Lütfen önce profil resmi ekleyin",
        isFail: true,
      );
      return;
    }
    await EasyLoading.show(maskType: EasyLoadingMaskType.black);
    await estimation(imageUrl: imageUrl);
    if (ageResults.isNotEmpty) {
      await disposeModel();
      await loadModel(isAgeModel: false);
      await estimation(
        imageUrl: imageUrl,
        isAgeEstimation: false,
      );
      if (genderResults.isNotEmpty) {
        dataset = await CsvService.loadCsvDataset();
        reccomendation();
        isComplateRecommendation = true;
        notifyListeners();
      }
    }
    await EasyLoading.dismiss();
    uiUtils.showSnackbar(
      context: context,
      text: "Önerme başarıyla tamamlandı!",
    );
    onDispose();
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
      await file.delete();
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
    String ageLabel = getAgeLabel;
    String genderLabel = getGenderLabel;

    filterReccomendation(ageLabel, genderLabel);
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
    List<String> foodCategory = [];
    for (var i = 0; i < selectedFavFoodIndex; i++) {
      getModelCategory.add(filteredModel[i]);
      ReccomendationModel item = getModelCategory[i];
      log("${item.populationGroup} ${item.food} ${item.gender} ${item.preferenceCount}");
      foodCategory.add(getModelCategory[i].food);
    }
    matchDatasFromDatasetAndUserSelection(foodCategory);
  }

  void matchDatasFromDatasetAndUserSelection(List<String> foodCategory) {
    int matchCount = 0;
    for (var i = 0; i < selectedFavFoodIndex; i++) {
      ReccomendationFoodsModel item = selectedReccomendationFood[i];
      if (foodCategory.contains(item.categoryName)) {
        matchCount++;
        selectedFavFoodIndex == 1
            ? matchRate = 100
            : selectedFavFoodIndex == 2
                ? matchRate += 50
                : matchRate += 33.3;
        getRecommendedFoods(item);
      } else {
        selectedFavFoodIndex == 1
            ? matchRate = 50
            : selectedFavFoodIndex == 2
                ? matchRate += 25
                : matchRate += 16.5;
        if (matchCount == 0) {
          getRecommendedFoods(item);
        }
      }
    }
    log("Reccomendation Rate: $matchRate");
  }

  void getRecommendedFoods(ReccomendationFoodsModel item) {
    List<ReccomendationFoodsModel> temp = [];
    temp = reccomendationFoods
        .where((element) =>
            element.categoryName == item.categoryName &&
            element.foodName != item.foodName)
        .toList();
    for (var element in temp) {
      if (!selectedFavFoods.contains(element.foodName)) {
        suggestions.add(element.foodName ?? "null");
      }
    }
    suggestions = suggestions.toSet().toList();
    for (var element in suggestions) {
      log(element);
    }
  }

  String getAgeEstimation({bool isGroup = false}) {
    return FoodReccomendationUtils.getAgeEstimation(
      ageResults: ageResults,
      isGroup: isGroup,
    );
  }

  String get getGenderEstimation {
    return FoodReccomendationUtils.getGenderEstimation(
      genderResults: genderResults,
    );
  }

  bool get isGender {
    return FoodReccomendationUtils.isGender(
      genderResults: genderResults,
    );
  }

  String getConfidence({bool isAgeEstimation = true}) {
    return FoodReccomendationUtils.getConfidence(
      ageResults: ageResults,
      genderResults: genderResults,
      isAgeEstimation: isAgeEstimation,
    );
  }

  String get getAgeLabel {
    return FoodReccomendationUtils.getAgeLabel(ageResults: ageResults);
  }

  String get getGenderLabel {
    return FoodReccomendationUtils.getGenderLabel(genderResults: genderResults);
  }

  void onDispose() {
    searchController.clear();
    selectedReccomendationFood = [];
    searchReccomendationFoodsList = [];
    matchRate = 0;
    isComplateRecommendation = false;
    selectedFavFoodIndex = 0;
    for (var element in reccomendationFoods) {
      element.isSelectedDTO = false;
    }
  }
}
