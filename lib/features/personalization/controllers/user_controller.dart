import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/auth/auth_repo.dart';
import 'package:xstore/data/repositories/user/user_model.dart';
import 'package:xstore/data/repositories/user/user_repo.dart';
import 'package:xstore/features/auth/controllers/network/network_manager.dart';
import 'package:xstore/features/auth/screens/login/login.dart';
import 'package:xstore/features/personalization/screens/re_auth_user.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/popups/full_screen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPass = TextEditingController();
  final userRepo = Get.put(UserRepo());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepo.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          final user = UserModel(
            id: userCredential.user!.uid,
            username: username,
            email: userCredential.user!.email ?? '',
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );

          await userRepo.saveUserRecord(user);
        }
      }
    } catch (e) {
      XLoaders.warningSnackBar(
          title: "Data not saved", message: "Something went wrong");
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(XSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently",
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          side: const BorderSide(color: Colors.red),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: XSizes.lg),
          child: Text("Delete"),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text("Cancel"),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      XFullScreenLoader.openLoadingDialog(
        "Processing...",
        XImages.gLoading,
      );

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        await auth.deleteAccount();
        XFullScreenLoader.stopLoading();
        Get.offAll(() => const LoginScreen());
      } else if (provider == 'password') {
        XFullScreenLoader.stopLoading();
        Get.to(() => const ReAuthLoginForm());
      }
    } catch (e) {
      XFullScreenLoader.stopLoading();
      XLoaders.warningSnackBar(title: "Oh no!", message: e.toString());
    }
  }

  Future<void> reAuthEmailandPassUser() async {
    try {
      XFullScreenLoader.openLoadingDialog(
        "Processing...",
        XImages.googleLoading,
      );

      // Check internet
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

      // Validation
      if (!reAuthFormKey.currentState!.validate()) {
        XFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthEmailandPassUser(
        verifyEmail.text.trim(),
        verifyPass.text.trim(),
      );
      await AuthenticationRepository.instance.deleteAccount();

      XFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      XFullScreenLoader.stopLoading();
      XLoaders.warningSnackBar(
        title: "Wrong Email or Password",
        message: "in order to delete account, you must verify it's yours",
      );
    }
  }

  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUploading.value = true;

        final imageUrl =
            await userRepo.uploadImage('Users/Images/Profile/', image);

        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepo.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        
        XLoaders.successSnackBar(
          title: "Congratulations!",
          message: "Your Profile picture has been updated!",
        );
      }
    } catch (e) {
      XLoaders.errorSnackBar(
        title: "Oh no!",
        message: "Something went wrong : $e",
      );
    } finally {
      imageUploading.value = false;
    }
  }
}
