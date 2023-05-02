class VersionCustomException implements Exception {
  VersionCustomException(this.description);

  final String description;
  @override
  String toString() {
    return '$this $description';
  }
}