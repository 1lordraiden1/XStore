import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';
import 'package:xstore/utils/theme/custom/shadow.dart';

class XProductCardHorizontal extends StatelessWidget {
  const XProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [XShadowStyle.horizontalProductShadow],
        borderRadius: BorderRadius.circular(XSizes.productImageRadius),
        color: dark ? XColors.darkenGrey : XColors.white,
      ),
      child: Row(
        children: [
          // Thumnail
          XRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(XSizes.md),
            backgroundColor: dark ? XColors.dark : XColors.light,
            child: Stack(
              children: [
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: XRoundedImage(
                    imageUrl: XImages.facebook,
                    applyImageRadius: true,
                  ),
                ),

                /// -- Sale Tag

                Positioned(
                  top: 12,
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

          // Details

          const SizedBox(
            width: 172,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: XSizes.sm),
                  child: Column(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
