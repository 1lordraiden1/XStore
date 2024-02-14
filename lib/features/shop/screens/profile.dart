import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
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

              Row(
                children: [
                  Text(
                    "Name",
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Mahmoud Ali",
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
