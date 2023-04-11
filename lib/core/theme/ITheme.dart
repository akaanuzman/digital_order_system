// ignore_for_file: file_names


import 'color/my_colors.dart';
import 'text/my_texts.dart';

abstract class ITheme {
  MyColors get colors => MyColors.instance;
  MyTexts get texts => MyTexts.instance;
}
