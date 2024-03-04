import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_horizontal.dart';
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
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 135,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const XProductCardHorizontal(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: XSizes.spaceBtwItems,
                      ),
                    ),
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
