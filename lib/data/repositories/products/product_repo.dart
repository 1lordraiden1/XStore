import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/data/services/firebase_services.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/enums.dart';
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

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      final list =
          snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return list;
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Getting All Products";
    }
  }

  Future<List<ProductModel>> getProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> list = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Getting All Products";
    }
  }

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Getting Featured Products";
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
          List<String> imagesUrl = [];

          for (var image in product.images!) {
            final assetImage = await storage.getImageDataFromAssets(image);

            final url = await storage.uploadImageData(
              'Products/Images',
              assetImage,
              image,
            );
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            final url = await storage.uploadImageData(
              'Products/Images',
              assetImage,
              variation.image,
            );
            variation.image = url;
          }
        }

        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } catch (e) {
      throw e.toString();
    }
  }

  // Products For Brands
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Products for Categories

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('Category.id', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('Category.id', isEqualTo: categoryId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();

      return products;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
