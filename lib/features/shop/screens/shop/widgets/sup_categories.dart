import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const XAppBar(
        title: Text("Clothes"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              const XRoundedImage(
                imageUrl: XImages.yasuo,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              // Sub Categories
              Column(
                children: [
                  XSectionHeading(
                    title: "T-shirts",
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwItems / 2,
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
