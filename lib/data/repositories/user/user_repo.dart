

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:xstore/utils/exceptions/firebase_exceptions.dart';
import 'package:xstore/utils/exceptions/format_exception.dart';
import 'package:xstore/utils/exceptions/platform_exception.dart';

import 'user_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      //_db.collection("Users").doc(user.id).set(user.toJson());

      await _db.collection("Users").doc(user.id).set(
            user.toJson(),
          );
    } on FirebaseAuthException catch (e) {
      throw XFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on FormatException catch (e) {
      throw XFomratException(error: e.message);
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
