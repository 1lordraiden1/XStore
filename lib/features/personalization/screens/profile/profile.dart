import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const XCircularImage(
                        width: 80, height: 80, image: XImages.facebook),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Mahmoud Ali"),
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

              const XProfileMenu(title: "Name", value: "Mahmoud Ali"),

              const XProfileMenu(title: "Username", value: "Mahmoud_Ali"),

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

              const XProfileMenu(title: "User ID", value: "5451"),

              const XProfileMenu(
                  title: "Email", value: "Mahmoud_Ali@gmail.com"),

              const XProfileMenu(
                  title: "Phone Number", value: "+2011-124-420-54"),

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
                  onPressed: () {},
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
