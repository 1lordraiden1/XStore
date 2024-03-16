import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/data/services/firebase_services.dart';
import 'package:xstore/features/shop/models/brand_model.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/exceptions/firebase_exceptions.dart';
import 'package:xstore/utils/exceptions/platform_exception.dart';

class BrandRepo extends GetxController {
  static BrandRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> fetchBrands() async {
    try {
      final result = await _db
          .collection('Brands')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return result.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.message!);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong while fetching Brands";
    }
  }

  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      final storage = Get.put(XFirebaseStorageService());

      for (var brand in brands) {
        final file = await storage.getImageDataFromAssets(brand.image);

        final url = await storage.uploadImageData(
          'Brands',
          file,
          brand.image,
        );
        brand.image = url;

        await _db.collection('Brands').doc(brand.image).set(
              brand.toJson(),
            );
      }
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }


  
}
