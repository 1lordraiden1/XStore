import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/features/shop/models/banner_model.dart';
import 'package:xstore/utils/exceptions/firebase_exceptions.dart';
import 'package:xstore/utils/exceptions/platform_exception.dart';

class BannerRepo extends GetxController {
  static BannerRepo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();

      return result.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.message!);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong while fetching banners";
    }
  }
}
