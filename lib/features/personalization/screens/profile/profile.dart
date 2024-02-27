import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:xstore/common/shimmer/shimmer_effect.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/personalization/controllers/user_controller.dart';
import 'package:xstore/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:xstore/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const XAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      // Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Pic
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(
                      () {
                        return controller.imageUploading.value
                            ? const XShimmerEffect(
                                width: 80,
                                height: 80,
                                radius: 80,
                              )
                            : XCircularImage(
                                width: 80,
                                height: 80,
                                image:
                                    controller.user.value.profilePicture != ''
                                        ? controller.user.value.profilePicture
                                        : XImages.facebook,
                              );
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              const XSectionHeading(title: "Profile Info"),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              XProfileMenu(
                title: "Name",
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),

              XProfileMenu(
                  title: "Username", value: controller.user.value.username),

              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              const Divider(),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              const XSectionHeading(title: "Profile Info"),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              XProfileMenu(title: "User ID", value: controller.user.value.id),

              XProfileMenu(title: "Email", value: controller.user.value.email),

              XProfileMenu(
                title: "Phone Number",
                value: (controller.user.value.phoneNumber != '')
                    ? controller.user.value.phoneNumber
                    : "Not added",
              ),

              const XProfileMenu(title: "Gender", value: "Male"),

              const XProfileMenu(title: "Date of Birth", value: "25 Nov, 1999"),

              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              const Divider(),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
