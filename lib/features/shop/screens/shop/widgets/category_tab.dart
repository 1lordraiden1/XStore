import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xstore/common/shimmer/vertical_shimmer.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/controllers/category_contoller.dart';
import 'package:xstore/features/shop/models/category_model.dart';
import 'package:xstore/features/shop/screens/all_products/all_products.dart';
import 'package:xstore/features/shop/screens/shop/widgets/category_brands.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/cloud_helper_functions.dart';

class XCategoryTab extends StatelessWidget {
  const XCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              // Brands
              CategoryBrands(category: category),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              // Products
              FutureBuilder(
                  future: controller.getCategoryProducts(
                      categoryId: category.id, limit: 4),
                  builder: (context, snapshot) {
                    final response =
                        XCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const XVerticalProductShimmer());
                    if (response != null) return response;

                    final products = snapshot.data!;

                    return Column(
                      children: [
                        XSectionHeading(
                          title: "You May like",
                          onPressed: () => Get.to(
                            () => AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                categoryId: category.id,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: XSizes.spaceBtwItems,
                        ),
                        XGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => XProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
