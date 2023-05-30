extension StringExtensions on String {
  String get toPng {
    return "assets/images/$this.png";
  }

  String get toJpg {
    return "assets/images/$this.jpg";
  }

  String get toJpeg {
    return "assets/images/$this.jpeg";
  }
}
