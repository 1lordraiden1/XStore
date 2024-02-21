import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/auth_repo.dart';
import 'package:xstore/data/repositories/user/user_model.dart';
import 'package:xstore/data/repositories/user/user_repo.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';
import 'package:xstore/features/auth/screens/signup/verify_email.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  // Variables

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      // Start Loading
      XFullScreenLoader.openLoadingDialog(
        "Processing...",
        XImages.onBoardingImage3,
      );

      // Check Internet Connectivity

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

      if (!signupFormKey.currentState!.validate()) {
        XFullScreenLoader.stopLoading();
        return;
      }

      // Privacy check

      if (!privacyPolicy.value) {
        XLoaders.warningSnackBar(
            title: "Accept Privacy Policy",
            message:
                "in order to create account, you must have to read and accept the Privacy Policy & Terms of Use.");
        return;
      }

      // Register user in the FB Auth
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailandPassword(
              email.text.trim(), password.text.trim());

      // Saving Authed user data

      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: username.text.trim(),
        email: email.text.trim(),
        
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepo = Get.put(UserRepo());

      await userRepo.saveUserRecord(newUser);

      XLoaders.successSnackBar(
        title: "Congratulations",
        message: ' Your account has been created! Verify to continue. ',
      );

      Get.to(() => VerifyEmail(email: email.text.trim()));
    } catch (e) {
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    }
  }
}
