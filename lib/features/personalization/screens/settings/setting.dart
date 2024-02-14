import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/common/widgets/shapes/containers/primary_header_container.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/common/widgets/tiles/user_tile.dart';
import 'package:xstore/features/shop/screens/home/home.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    actions: [
                      XCircularIcon(
                        icon: Iconsax.add,
                        onPressed: () => Get.to(
                          const HomeScreen(),
                        ),
                      ),
                    ],
                  ),
                  const XUserProfileTile(),
                  const SizedBox(
                    height: XSizes.spaceBtwSections + 2,
                  ),
                ],
              ),
            ),

            // Body

            const Padding(
              padding: EdgeInsets.all(XSizes.defaultSpace),
              child: Column(
                children: [
                  XSectionHeading(title: "Account Settings"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
