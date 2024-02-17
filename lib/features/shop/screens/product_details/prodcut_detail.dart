import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/shapes/curved_edges/curved_edges_widget.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:xstore/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:xstore/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

import 'widgets/product_image_slider.dart';
import 'widgets/rating_share_widget.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const XBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image Slider

            const XProductImageSlider(),

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

                  XProductMetaData(),

                  XProductAttributes(),

                  SizedBox(
                    height: XSizes.spaceBtwSections,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Checkout'),
                    ),
                  ),
                  SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),

                  XSectionHeading(title: "Description"),
                  SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),

                  ReadMoreText(
                    "This is the description of the product and it can go upto max 4 lines This is the description of the product and it can go upto max 4 lines This is the description of the product and it can go upto max 4 lines",
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

                  Divider(),
                  SizedBox(
                    height: XSizes.spaceBtwItems,
                  ),
                  XSectionHeading(
                    title: "Reviews(199)",
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  SizedBox(
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
