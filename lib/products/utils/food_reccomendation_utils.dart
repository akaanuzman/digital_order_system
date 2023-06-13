import 'package:flutter/material.dart';

@immutable
class FoodReccomendationUtils {
  const FoodReccomendationUtils._();

  static String getAgeEstimation({
    required List ageResults,
    bool isGroup = false,
  }) {
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
          return 'Something went wrong';
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
          return 'Something went wrong';
      }
    }
  }

  static String getGenderEstimation({required List genderResults}) {
    switch (genderResults.first['label']) {
      case 'female':
        return 'Bayan';
      case 'male':
        return 'Erkek';
      default:
        return 'Something went wrong';
    }
  }

  static bool isGender({required List genderResults}) {
    String gender = getGenderEstimation(genderResults: genderResults);
    if (gender == 'Bayan') {
      return false;
    } else {
      return true;
    }
  }

  static String getConfidence({
    bool isAgeEstimation = true,
    required List ageResults,
    required List genderResults,
  }) {
    double confidence = isAgeEstimation
        ? ageResults.first['confidence']
        : genderResults.first['confidence'];
    if (confidence == 1.0) {
      return (confidence * 100).toString();
    } else {
      return (confidence * 100).toStringAsFixed(1);
    }
  }

  static String getAgeLabel({
    required List ageResults,
  }) {
    switch (ageResults.first['label']) {
      case 'baby':
        return 'Baby';
      case 'child':
        return 'Child';
      case 'youth':
        return 'Youth';
      case 'adult':
        return 'Adult';
      case 'old':
        return 'Old';
      default:
        return 'Something went wrong';
    }
  }

  static String getGenderLabel({
    required List genderResults,
  }) {
    switch (genderResults.first['label']) {
      case 'female':
        return 'Female';
      case 'male':
        return 'Male';
      default:
        return 'Something went wrong';
    }
  }
}
