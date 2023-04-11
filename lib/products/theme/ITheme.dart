// ignore_for_file: file_names


import 'color/app_colors.dart';
import 'text/app_texts.dart';

abstract class ITheme {
  AppColors get colors => AppColors.instance;
  AppTexts get texts => AppTexts.instance;
}
