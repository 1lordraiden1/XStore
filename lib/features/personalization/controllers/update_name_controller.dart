import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/user/user_repo.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';
import 'package:xstore/features/personalization/controllers/user_controller.dart';
import 'package:xstore/features/personalization/screens/profile/profile.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepo = Get.put(UserRepo());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    initializeNames();
    super.onInit();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      XFullScreenLoader.openLoadingDialog(
        "Updating data...",
        XImages.onBoardingImage3,
      );

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
      if (!updateUserNameFormKey.currentState!.validate()) {
        XFullScreenLoader.stopLoading();
        return;
      }

      // Update user data

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      await userRepo.updateSingleField(name);

      // Update the Rx User value

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      XFullScreenLoader.stopLoading();

      XLoaders.successSnackBar(
        title: "Congratulations",
        message: 'Your Name has been updated',
      );

      Get.off(() => const ProfileScreen());
    } catch (e) {
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    }
  }
}
