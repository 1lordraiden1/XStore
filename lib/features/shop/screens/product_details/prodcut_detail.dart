import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:xstore/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:xstore/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:xstore/utils/constants/enums.dart';
import 'package:xstore/utils/constants/sizes.dart';

import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const XBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider

            XProductImageSlider(product: product),

            // Details

            Padding(
              padding: const EdgeInsets.only(
                  left: XSizes.defaultSpace,
                  right: XSizes.defaultSpace,
                  bottom: XSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button

                  const XRatingAndShare(
                    ratingRank: '5.0',
                    numberOfRates: '999',
                  ),

                  XProductMetaData(
                    product: product,
                  ),

                  if (product.productType == ProductType.variable.toString())
                    XProductAttributes(
                      product: product,
                    ),

                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(
                      height: XSizes.spaceBtwSections,
                    ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),

                  const XSectionHeading(title: "Description"),
                  const SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),

                  ReadMoreText(
                    product.description ?? '',
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  const Divider(),
                  const SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),
                  XSectionHeading(
                    title: "Reviews(199)",
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: XSizes.spaceBtwItems,
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
