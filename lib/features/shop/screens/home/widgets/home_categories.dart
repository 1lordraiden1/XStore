import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/shimmer/category_shimmer.dart';
import 'package:xstore/common/widgets/image_text/vertical_image_text.dart';
import 'package:xstore/features/shop/controllers/category_contoller.dart';
import 'package:xstore/features/shop/screens/shop/widgets/sup_categories.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XHomeCategories extends StatelessWidget {
  const XHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if (categoryController.isLoading.value) return const XCategoryShimmer();

        if (categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              "No Data Found!",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          );
        }
        return SizedBox(
          height: 90,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.featuredCategories.length,
            separatorBuilder: (_, index) {
              return const SizedBox(
                width: XSizes.spaceBtwItems,
              );
            },
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return XVerticalImageText(
                image: category.image,
                textColor: XColors.white,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
          ),
        );
      },
    );
  }
}
