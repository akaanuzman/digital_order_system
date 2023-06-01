// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'dart:math' hide log;

import 'package:digital_order_system/core/utils/navigator_service.dart';
import 'package:digital_order_system/products/utility/base/base_singleton.dart';
import 'package:digital_order_system/products/utility/service/csv_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
class FoodReccomendationViewModel extends ChangeNotifier with BaseSingleton {
  late String? response;
  List ageResults = [];
  List genderResults = [];
  bool isComplateRecommendation = false;

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
        isComplateRecommendation = true;
        await CsvService().loadCsvDataset();
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
    File file = await _fileFromImageUrl(imageUrl);
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

  Future<File> _fileFromImageUrl(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final documentDirectory = await getApplicationDocumentsDirectory();
    String randomNumber = (Random().nextInt(899999) + 100000).toString();
    final file = File(join(documentDirectory.path, '$randomNumber.jpg'));
    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }

  String getAgeEstimation({bool isGroup = false}) {
    if (isGroup) {
      switch (ageResults.first['label']) {
        case 'baby':
          return 'Bebek';
        case 'child':
          return 'Çocuk';
        case 'youth':
          return 'Genç';
        case 'adult':
          return 'Orta Yaşlı';
        case 'old':
          return 'Yaşlı';
        default:
          return 'Bir hata oluştu';
      }
    } else {
      switch (ageResults.first['label']) {
        case 'baby':
          return '0-4 Yaş Aralığı';
        case 'child':
          return '5-17 Yaş Aralığı';
        case 'youth':
          return '18-35 Yaş Aralığı';
        case 'adult':
          return '36-60 Yaş Aralığı';
        case 'old':
          return '61-100 Yaş Aralığı';
        default:
          return 'Bir hata oluştu';
      }
    }
  }

  String get getGenderEstimation {
    switch (genderResults.first['label']) {
      case 'female':
        return 'Bayan';
      case 'male':
        return 'Erkek';
      default:
        return 'Bir hata oluştu';
    }
  }

  bool get isGender {
    String gender = getGenderEstimation;
    if (gender == 'Bayan') {
      return false;
    } else {
      return true;
    }
  }

  String getConfidence({bool isAgeEstimation = true}) {
    double confidence = isAgeEstimation
        ? ageResults.first['confidence']
        : genderResults.first['confidence'];
    if (confidence == 1.0) {
      return (confidence * 100).toString();
    } else {
      return (confidence * 100).toStringAsFixed(1);
    }
  }
}
