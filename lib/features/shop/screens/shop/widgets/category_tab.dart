import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/brand/brand_showcase_card.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/screens/home/home.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XCategoryTab extends StatelessWidget {
  const XCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              XBrandShowCase(
                images: [
                  XImages.yasuo,
                  XImages.darkAppLogo,
                  XImages.lightAppLogo
                ],
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              XSectionHeading(title: "You May like"),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              XGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const XProductCardVertical(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
