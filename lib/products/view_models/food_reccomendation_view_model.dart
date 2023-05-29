// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'dart:math' hide log;

import 'package:tflite/tflite.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FoodReccomendationViewModel extends ChangeNotifier {
  late String? response;
  List results = [];
  bool isRecommendation = false;

  Future loadAIModelFromAsset() async {
    Tflite.close();
    response = await Tflite.loadModel(
      model: "assets/ai/new_model.tflite",
      labels: "assets/ai/new_label.txt",
      numThreads: 2,
    );
    log("Model loaded: $response");
  }

  Future disposeModel() async {
    await Tflite.close();
  }

  Future imageClassification(String imageUrl) async {
    File file = await _fileFromImageUrl(imageUrl);
    log(file.path);
    try {
      var recognitions = await Tflite.runModelOnImage(
        path: file.path,
      );
      results = recognitions ?? [];
      if (results.isNotEmpty) {
        isRecommendation = true;
      }
      notifyListeners();
      log("Results is: $results");
      log("Recognitions is: $recognitions");
    } catch (e) {
      log(e.toString());
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
      switch (results.first['label']) {
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
      switch (results.first['label']) {
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
}
