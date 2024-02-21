import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/auth_repo.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final localStorge = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
