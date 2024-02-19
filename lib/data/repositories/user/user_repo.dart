import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'user_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw FirebaseException(code: e.code, plugin: e.plugin);
    }
  }
}
