import 'dart:io';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileService {
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future uploadImage(String filePath, String imagePath) async {
    try {
      var imageRef = firebaseStorage.ref();
      String randomNumber = (Random().nextInt(899999) + 100000).toString();
      imagePath += randomNumber;
      var path = imageRef.child(imagePath);
      TaskSnapshot taskSnapshot = await path.putFile(File(filePath));
      String url = await taskSnapshot.ref.getDownloadURL();
      return [url, imagePath];
    } on FirebaseException catch (e) {
      dev.log(e.toString());
      return false;
    }
  }

  Future deleteImage(String imagePath) async {
    try {
      var imageRef = firebaseStorage.ref();
      var path = imageRef.child(imagePath);
      await path.delete();
      return true;
    } on FirebaseException catch (e) {
      dev.log(e.toString());
      return false;
    }
  }

  Future<File> fileFromImageUrl(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final documentDirectory = await getApplicationDocumentsDirectory();
    String randomNumber = (Random().nextInt(899999) + 100000).toString();
    final file = File(join(documentDirectory.path, '$randomNumber.jpg'));
    file.writeAsBytesSync(response.bodyBytes);
    return file;
  }
}
