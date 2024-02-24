import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:xstore/features/auth/screens/login/login.dart';
import 'package:xstore/features/auth/screens/onboarding/onboarding.dart';
import 'package:xstore/features/auth/screens/signup/verify_email.dart';
import 'package:xstore/navigation_menu.dart';
import 'package:xstore/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:xstore/utils/exceptions/firebase_exceptions.dart';
import 'package:xstore/utils/exceptions/format_exception.dart';
import 'package:xstore/utils/exceptions/platform_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    // local Storage
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmail(email: _auth.currentUser?.email));
      }
    } else {
      deviceStorage.writeIfNull("isFirstTime", true);
      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(const OnBoardingScreen());
    }
  }

  Future<UserCredential> loginWithEmailandPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw XFirebaseAuthException(e.code).message;
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

  Future<UserCredential?> signInWithGoogle() async {
    //
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await _auth.signInWithCredential(credentials);
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

  Future<UserCredential?> registerWithEmailandPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
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
      if (kDebugMode) print("Something went wrong : $e");
      return null;
    }
  }

  Future<void> sendEmailVerfiicaton() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
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

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  // Logout

  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw XFirebaseAuthException(e.code).message;
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
