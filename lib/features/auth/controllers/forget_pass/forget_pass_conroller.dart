import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/auth_repo.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';
import 'package:xstore/features/auth/screens/login/reset_pass.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/popups/full_screen_loader.dart';

class ForgetPassController extends GetxController {
  static ForgetPassController get instance => Get.find();

  final email = TextEditingController();

  GlobalKey<FormState> forgetPassFormKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      XFullScreenLoader.openLoadingDialog(
          "Processing ...", XImages.gLoading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XFullScreenLoader.stopLoading();
        return;
      }

      if (!forgetPassFormKey.currentState!.validate()) {
        XFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text,
      );

      XFullScreenLoader.stopLoading();

      XLoaders.successSnackBar(
        title: "Email Sent",
        message: 'Email Link Sent to Reset your Password'.tr,
      );

      // Redirect

      Get.to(
        () => ResetPassScreen(
          image: XImages.onBoardingImage3,
          title: "Check your Email",
          email: email.text.trim(),
         
        ),
      );
    } catch (e) {
      XFullScreenLoader.stopLoading();

      XLoaders.errorSnackBar(
        title: "Oh no!",
        message: e.toString(),
      );
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      XFullScreenLoader.openLoadingDialog(
          "Processing ...", XImages.gLoading);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        XFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email,
      );

      XFullScreenLoader.stopLoading();

      XLoaders.successSnackBar(
        title: "Email Sent",
        message: 'Email Link Sent to Reset your Password'.tr,
      );

      // Redirect

      
    } catch (e) {
      XFullScreenLoader.stopLoading();

      XLoaders.errorSnackBar(
        title: "Oh no!",
        message: e.toString(),
      );
    }
  }
}
