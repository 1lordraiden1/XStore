import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/shimmer/brands_shimmer.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/brand/brand_card.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/controllers/product/brand_controller.dart';
import 'package:xstore/features/shop/screens/all_products/brand_products.dart';
import 'package:xstore/utils/constants/sizes.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const XAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              const XSectionHeading(
                title: 'Brands',
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              // Brands
              Obx(
                () {
                  if (brandController.isLoading.value) return const XBrandsShimmer();

                  if (brandController.allBrands.isEmpty) {
                    return Center(
                      child: Text(
                        "No Data Found",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white),
                      ),
                    );
                  }
                  return XGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];
                      return XBrandCard(
                        brand: brand,
                        showBorder: true,
                        onTap: ()=> Get.to(()=> BrandProducts(brand: brand)),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
