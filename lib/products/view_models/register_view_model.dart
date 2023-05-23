import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isObscureText = true;
  File? selectedImage;
  bool isUploadNewImage = false;

  void get openOrCloseObscureText {
    isObscureText = !isObscureText;
    notifyListeners();
  }

  Future get selectImage async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      selectedImage = File(img.path);
      isUploadNewImage = true;
      notifyListeners();
    }
  }

  void get deleteImage async {
    selectedImage = null;
    isUploadNewImage = false;
    notifyListeners();
  }
}
