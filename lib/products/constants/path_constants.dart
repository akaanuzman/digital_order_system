enum PathConstants {
  ageModel('age_model'),
  genderModel('gender_model'),
  ageLabels('age_labels'),
  genderLabels('gender_labels'),
  dataset('food_recommendation_dataset');

  const PathConstants(this.value);
  final String value;

  String get toTflite => 'assets/ai/$value.tflite';
  String get toLabels => 'assets/ai/$value.txt';
  String get toCsv => 'assets/dataset/$value.csv';
}
