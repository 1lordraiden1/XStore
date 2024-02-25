import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:xstore/data/repositories/auth_repo.dart';
import 'package:xstore/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:xstore/utils/exceptions/firebase_exceptions.dart';
import 'package:xstore/utils/exceptions/format_exception.dart';
import 'package:xstore/utils/exceptions/platform_exception.dart';

import 'user_model.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save User data in FireStore

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
    } on FormatException catch (_) {
      throw XFomratException();
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  // Fetch user details based on user ID

  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw XFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on FormatException catch (_) {
      throw XFomratException();
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  // Update user data in FireStore

  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      //_db.collection("Users").doc(user.id).set(user.toJson());

      await _db.collection("Users").doc(updatedUser.id).update(
            updatedUser.toJson(),
          );
    } on FirebaseAuthException catch (e) {
      throw XFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on FormatException catch (_) {
      throw XFomratException();
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  // Update Specific field in user collection

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      //_db.collection("Users").doc(user.id).set(user.toJson());

      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
    } on FirebaseAuthException catch (e) {
      throw XFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on FormatException catch (_) {
      throw XFomratException();
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }

  // Remove user data from FireStore

  Future<void> removeUserRecord(String userId) async {
    try {
      //_db.collection("Users").doc(user.id).set(user.toJson());

      await _db.collection("Users").doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw XFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw XFirebaseException(error: e.code);
    } on FormatException catch (_) {
      throw XFomratException();
    } on PlatformException catch (e) {
      throw XPlatformException(error: e);
    } catch (e) {
      throw "Something went wrong, Please try again";
    }
  }
}
