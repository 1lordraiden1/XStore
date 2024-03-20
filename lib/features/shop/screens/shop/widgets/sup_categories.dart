import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/shimmer/brands_shimmer.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/controllers/category_contoller.dart';
import 'package:xstore/features/shop/models/category_model.dart';
import 'package:xstore/features/shop/screens/all_products/all_products.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/cloud_helper_functions.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: XAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              XRoundedImage(
                imageUrl: category.image,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              // Sub Categories
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    const loader = XBrandsShimmer();
                    final widget = XCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subCategory = subCategories[index];
                        // one item
                        return FutureBuilder(
                            future: controller.getCategoryProducts(
                                categoryId: subCategory.id),
                            builder: (context, snapshot) {
                              final widget =
                                  XCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  XSectionHeading(
                                    title: subCategory.name,
                                    showActionButton: true,
                                    onPressed: () => Get.to(
                                      () => AllProducts(
                                        title: subCategory.name,
                                        futureMethod:
                                            controller.getCategoryProducts(
                                                categoryId: subCategory.id,
                                                limit: -1),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: XSizes.spaceBtwItems / 2,
                                  ),
                                  SizedBox(
                                    height: 135,
                                    child: ListView.separated(
                                      itemCount: products.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          XProductCardHorizontal(
                                        product: products[index],
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        width: XSizes.spaceBtwItems,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
