import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/data/services/firebase_services.dart';
import 'package:xstore/features/shop/models/category_model.dart';
import 'package:xstore/utils/exceptions/firebase_exceptions.dart';
import 'package:xstore/utils/exceptions/platform_exception.dart';

class CategoryRepo extends GetxController {
  static CategoryRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();

      final list =
          snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();

      return list;
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  // Get sub Categories

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
     final snapshot = await _db.collection('Categories').where('ParentId', isEqualTo: categoryId).get();
     final results = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
     return results;
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }



  // Upload Categories to firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(XFirebaseStorageService());

      for (var category in categories) {
        final file = await storage.getImageDataFromAssets(category.image);

        final url = await storage.uploadImageData(
          'Categories',
          file,
          category.name,
        );
        category.image = url;

        await _db.collection('Categories').doc(category.id).set(
              category.toJson(),
            );
      }
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
