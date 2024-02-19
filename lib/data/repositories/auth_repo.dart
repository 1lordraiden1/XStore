import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xstore/features/auth/screens/login/login.dart';
import 'package:xstore/features/auth/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    // local Storage

    if (kDebugMode) {
      print('======================= GET STORAGE Auth Repo =======================');
      print(deviceStorage.read("isFirstTime"));
    }

    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(const OnBoardingScreen());
  }
}
