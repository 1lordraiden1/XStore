import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/common/widgets/shapes/containers/primary_header_container.dart';
import 'package:xstore/common/widgets/shapes/containers/search_container.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const XPrimaryHeaderContainer(
              child: Column(
                children: [
                  // AppBar
                  XHomeAppBarWidget(),

                  SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),

                  // Search Bar

                  XSearchContainer(
                    text: "Search here",
                    icon: Iconsax.search_normal,
                  ),
                  SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),

                  // Catgs Header

                  Padding(
                    padding: EdgeInsets.only(left: XSizes.defaultSpace),
                    child: Column(
                      children: [
                        XSectionHeading(
                          title: "Categories",
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: XSizes.spaceBtwItems,
                        ),
                        XHomeCategories(),
                        SizedBox(
                          height: XSizes.spaceBtwSections,
                        ),
                      ],
                    ),
                  ),

                  // Categories ->
                ],
              ),
            ),

            // Body

            Padding(
              padding: const EdgeInsets.all(XSizes.defaultSpace),
              child: Column(
                children: [
                  const XPromoSlider(
                    banners: [
                      XImages.yasuo,
                      XImages.space,
                      XImages.space1,
                    ],
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),
                  const XSectionHeading(
                    showActionButton: true,
                    title: "Popular products",
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),
                  XGridLayout(
                    itemBuilder: (_, index) => const XProductCardVertical(),
                    itemCount: 5,
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
