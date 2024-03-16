import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:xstore/common/shimmer/brands_shimmer.dart';
import 'package:xstore/common/shimmer/vertical_shimmer.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/brand/brand_card.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/controllers/product/brand_controller.dart';
import 'package:xstore/features/shop/models/brand_model.dart';
import 'package:xstore/features/shop/screens/all_products/sortable_products.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: XAppBar(
        title: Text(brand.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              XBrandCard(
                brand: brand,
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              FutureBuilder(
                future: brandController.getBrandProducts(brand.id),
                builder: (context, snapshot) {
                  const loader = XVerticalProductShimmer();
                  final widget = XCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                  if (widget != null ) return widget;

                  final brandProducts = snapshot.data!;
                  return  XSortableProducts(
                    products: brandProducts,
                  );
                }
              ),

              // Brands
            ],
          ),
        ),
      ),
    );
  }
}
