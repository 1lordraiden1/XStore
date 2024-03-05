import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/data/services/firebase_services.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/exceptions/firebase_exceptions.dart';
import 'package:xstore/utils/exceptions/platform_exception.dart';

class ProductRepo extends GetxController {
  static ProductRepo get instance => Get.find();
/*
  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }*/

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();

      final list =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return list;
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(XFirebaseStorageService());

      for (var product in products) {
        final thumnail = await storage.getImageDataFromAssets(product.thumnail);

        final url = await storage.uploadImageData(
          'Products/Images',
          thumnail,
          product.thumnail.toString(),
        );
        product.thumnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];

          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData(
              'Products/Images',
              assetImage,
              image,
            );
            product.thumnail = url; //
          }
        }

        await _db.collection('Products').doc(product.id).set(
              product.toJson(),
            );
      }
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
