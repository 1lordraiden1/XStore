import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/user/user_model.dart';
import 'package:xstore/data/repositories/user/user_repo.dart';

class UserController extends GetxController {
  UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepo = Get.put(UserRepo());

  @override
  void onInit() {
    // TODO: implement onInit
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
      if (userCredential != null) {
        final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        final user = UserModel(
          id: userCredential.user!.uid,
          username: username,
          email: userCredential.user!.email ?? '',
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
        );

        await userRepo.saveUserRecord(user);
      }
    } catch (e) {
      XLoaders.warningSnackBar(
          title: "Data not saved", message: "Something went wrong");
    }
  }
}
