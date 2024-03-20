import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/shimmer/vertical_shimmer.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/common/widgets/shapes/containers/primary_header_container.dart';
import 'package:xstore/common/widgets/shapes/containers/search_container.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/controllers/product/product_controller.dart';
import 'package:xstore/features/shop/controllers/search_controller.dart';
import 'package:xstore/features/shop/screens/all_products/all_products.dart';
import 'package:xstore/features/shop/screens/search/search_screen.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';
import 'widgets/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final searchController = Get.put(XSearchController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            XPrimaryHeaderContainer(
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
                    onTap: () => Get.to(
                      () => Hero(
                        child: const SearchScreen(),
                        tag: 'search',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),

                  // Catgs Header // isSearching

                  Padding(
                    padding: EdgeInsets.only(left: XSizes.defaultSpace),
                    child: Column(
                      children: [
                        XSectionHeading(
                          title: "Categories",
                          textColor: XColors.white,
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
                  const XPromoSlider(),
                  const SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),
                  XSectionHeading(
                    showActionButton: true,
                    title: "Popular products",
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: 'Popular Products',
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const XVerticalProductShimmer();
                      }

                      if (controller.featuredProducts.isEmpty) {
                        // delete all products case
                        return Center(
                          child: Text(
                            "No Data Found!",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        );
                      }

                      return XGridLayout(
                        itemBuilder: (_, index) => XProductCardVertical(
                          product: controller.featuredProducts[index],
                        ),
                        itemCount: controller.featuredProducts.length,
                      );
                    },
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
