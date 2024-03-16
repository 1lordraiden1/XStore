import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/product_price.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/features/shop/screens/product_details/prodcut_detail.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XProductCardHorizontal extends StatelessWidget {
  const XProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(
        () => ProductDetailScreen(
          product: product,
        ),
      ),
      child: Container(
        width: 310,
        //height: 200,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(XSizes.productImageRadius),
          color: dark ? XColors.darkenGrey : XColors.softGrey,
        ),
        child: Row(
          children: [
            // Thumnail
            XRoundedContainer(
              height: 200,
              //width: 100,
              padding: const EdgeInsets.all(XSizes.md),
              backgroundColor: dark ? XColors.dark : XColors.light,
              child: Stack(
                children: [
                  const SizedBox(
                    width: 100,
                    height: 100,
                    child: XRoundedImage(
                      imageUrl: XImages.facebook,
                      applyImageRadius: true,
                    ),
                  ),

                  /// -- Sale Tag

                  Positioned(
                    top: 10,
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

                  Positioned(
                    top: 0,
                    right: 0,
                    child: XFavoriteIcon(
                      productId: product.id,
                    ),
                  ),
                ],
              ),
            ),

            // Details
            //const Spacer(),
            SizedBox(
              width: 172,
              //height: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: XSizes.sm, left: XSizes.sm),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        XProductTitleText(
                          title: "White Google T-shirt",
                          smallSize: true,
                        ),
                        SizedBox(
                          height: XSizes.spaceBtwItems / 2,
                        ),
                        XBrandTitleVerfiedIcon(
                          title: "Google",
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: XProductPrice(price: "189.99"),
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
            ),
          ],
        ),
      ),
    );
  }
}
