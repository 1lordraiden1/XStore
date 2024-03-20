import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/data/services/firebase_services.dart';
import 'package:xstore/features/shop/models/brand_model.dart';
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

  Future<List<BrandModel>> getCategoryBrands({required String categoryId}) async {
    try {
      // Query to get all docs where categoryId matches the provided one
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('categoryId', isEqualTo: categoryId)
          .get();

      // Extract brandIds from documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'].toString() ).toList(); // as String

      // Query to get all docs where brandId is in the brandIds
      final brandQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      List<BrandModel> brands = brandQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;


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
