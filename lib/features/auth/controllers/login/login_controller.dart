import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/auth_repo.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';
import 'package:xstore/features/personalization/controllers/user_controller.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  @override
  void onInit() {
    email.text = localStorge.read("REMEMBER_ME_EMAIL") ?? '';
    password.text = localStorge.read("REMEMBER_ME_PASSWORD") ?? '';
    super.onInit();
  }

  final localStorge = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading

      XFullScreenLoader.openLoadingDialog(
        "Logging you in...",
        XImages.onBoardingImage2,
      );

      // Check Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XFullScreenLoader.stopLoading();
        XLoaders.warningSnackBar(
          title: "No Internet Connection",
          message:
              "in order to create account, you must have access to Internet",
        );

        return;
      }

      // Form Validation

      if (!loginFormKey.currentState!.validate()) {
        XFullScreenLoader.stopLoading();
        return;
      }

      // Save data for Remember me

      if (rememberMe.value) {
        localStorge.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorge.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      final userCredential =
          await AuthenticationRepository.instance.loginWithEmailandPassword(
        email.text.trim(),
        password.text.trim(),
      );

      await userController.saveUserRecord(userCredential);

      // Remove Loader
      XFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start
      XFullScreenLoader.openLoadingDialog(
        "Logging you in...",
        XImages.onBoardingImage3,
      );

      // Check Connection

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XFullScreenLoader.stopLoading();
        XLoaders.warningSnackBar(
          title: "No Internet Connection",
          message:
              "in order to create account, you must have access to Internet",
        );

        return;
      }

      // Google Auth

      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user data
      await userController.saveUserRecord(userCredential);

      // Remove Loader

      XFullScreenLoader.stopLoading();

      // Redirect

      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    }
  }
}
