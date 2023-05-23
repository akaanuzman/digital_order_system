import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageViewModel extends ChangeNotifier {
  File? selectedImage;

  Future get selectImage async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      selectedImage = File(img.path);
      notifyListeners();
    }
  }

  void get deleteImage async {
    selectedImage = null;
    notifyListeners();
  }
}
