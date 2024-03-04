import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class XFirebaseStorageService extends GetxController {
  static XFirebaseStorageService get instance => Get.find();

  final _firebaeStorage = FirebaseStorage.instance;

  // Upload local assets from IDE
  // Returns a Uint8List containing image data

  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw 'Error loading image data : $e';
    }
  }

  // upload image using ImageData on Cloud Firebase Storage
  // Returns the download URL of the uploaded images

  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaeStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      throw 'Error loading image data : $e';
    }
  }
}
