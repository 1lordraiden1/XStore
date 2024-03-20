import 'package:flutter/material.dart';
import 'package:xstore/common/shimmer/brands_shimmer.dart';
import 'package:xstore/common/shimmer/vertical_shimmer.dart';
import 'package:xstore/common/widgets/brand/brand_showcase_card.dart';
import 'package:xstore/features/shop/controllers/product/brand_controller.dart';
import 'package:xstore/features/shop/models/category_model.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getCategoryBrands(category.id),
        builder: (context, snapshot) {
          const loader = Column(
            children: [
              XBrandsShimmer(),
              SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              XVerticalProductShimmer(),
              SizedBox(
                height: XSizes.spaceBtwItems,
              ),
            ],
          );
          final widget = XCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                future:
                    controller.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  final widget = XCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                  );
                  if (widget != null) return widget;

                  final products = snapshot.data!;
                  return XBrandShowCase(
                    images: products.map((e) => e.thumnail).toList(),
                    brand: brand,
                  );
                },
              );
            },
          );
        });
  }
}
