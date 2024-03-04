import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/shapes/containers/primary_header_container.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/common/widgets/tiles/setting_tile.dart';
import 'package:xstore/common/widgets/tiles/user_tile.dart';
import 'package:xstore/data/auth/auth_repo.dart';
import 'package:xstore/features/personalization/screens/profile/profile.dart';
import 'package:xstore/features/personalization/screens/settings/upload_screen.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = XHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            XPrimaryHeaderContainer(
              child: Column(
                children: [
                  XAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: XColors.white,
                          ),
                    ),
                  ),
                  XUserProfileTile(
                    onPressed: () => Get.to(
                      const ProfileScreen(),
                    ),
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwSections + 2,
                  ),
                ],
              ),
            ),

            // Body

            Padding(
              padding: const EdgeInsets.all(XSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Account Settings

                  const XSectionHeading(title: "Account Settings"),
                  const SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),
                  const XSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: "My Addresses",
                    subtitle: "Set delivery address",
                  ),
                  const XSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: "My Cart",
                    subtitle: "Add, remove and checkout",
                  ),
                  const XSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: "My Orders",
                    subtitle: "List of your Completed",
                  ),
                  const XSettingMenuTile(
                    icon: Iconsax.bank,
                    title: "Bank Account",
                    subtitle: "Withdraw balance ..",
                  ),
                  const XSettingMenuTile(
                    icon: Iconsax.discount_shape,
                    title: "My Coupons",
                    subtitle: "List of discounted Coupons",
                  ),
                  const XSettingMenuTile(
                    icon: Iconsax.notification,
                    title: "Notifications",
                    subtitle: "Manage Notifications",
                  ),
                  const XSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: "Account Privacy",
                    subtitle: "Manage Data",
                  ),

                  // App settings

                  const SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),
                  const XSectionHeading(title: "App Settings"),
                  const SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),
                  XSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload data to Cloud",
                    onTap: () => Get.to(() => const UploadOptionsScreen()),
                  ),
                  XSettingMenuTile(
                    icon: Iconsax.location,
                    title: "Location",
                    subtitle: "Set recommended locations",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  XSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe Mode",
                    subtitle: "Search results is safe",
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  XSettingMenuTile(
                    icon: Iconsax.image,
                    title: "HQ Image",
                    subtitle: "Set image quality",
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => AuthenticationRepository().logout(),
                      child: const Text("Log out"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
