extension StringExtensions on String {
  String get toPng {
    return "assets/images/$this.png";
  }

    String get toJpg {
    return "assets/images/$this.jpg";
  }
}
