import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/product_price.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/features/shop/screens/product_details/prodcut_detail.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';
import 'package:xstore/utils/theme/custom/shadow.dart';

class XProductCardVertical extends StatelessWidget {
  const XProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        //width: 180,
        height: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [XShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(XSizes.productImageRadius),
          color: dark ? XColors.darkenGrey : XColors.white,
        ),
        child: Column(
          children: [
            // Thumnail, Buttons and Tags

            XRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(XSizes.sm),
              backgroundColor: dark ? XColors.dark : XColors.light,
              child: Stack(
                children: [
                  const XRoundedImage(
                    imageUrl: XImages.google,
                  ),

                  // Tag

                  Positioned(
                    top: 5,
                    child: XRoundedContainer(
                      radius: XSizes.sm,
                      backgroundColor: XColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: XSizes.sm,
                        vertical: XSizes.xs,
                      ),
                      child: Text(
                        "-20%",
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: XColors.black,
                            ),
                      ),
                    ),
                  ),

                  // Fav Button

                  const Positioned(
                    top: 0,
                    right: 0,
                    child: XCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: XSizes.spaceBtwItems / 2,
            ),

            // Details

            const Padding(
              padding: EdgeInsets.all(XSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  XProductTitleText(
                    title: "White T-Shirt",
                    smallSize: true,
                  ),
                  SizedBox(
                    height: XSizes.spaceBtwItems / 2,
                  ),
                  XBrandTitleVerfiedIcon(
                    title: "T-Shirts",
                  ),
                ],
              ),
            ),

            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: XSizes.sm),
                  child: XProductPrice(price: '49.99'),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: XColors.dark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(XSizes.cardRadiusMd),
                      bottomRight: Radius.circular(
                        XSizes.productImageRadius,
                      ),
                    ),
                  ),
                  child: const SizedBox(
                    width: XSizes.iconLg * 1.2,
                    height: XSizes.iconLg * 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: XColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
