import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/shapes/curved_edges/curved_edges_widget.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XProductImageSlider extends StatelessWidget {
  const XProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return XClipPathWidget(
      child: Container(
        color: dark ? XColors.grey : XColors.light,
        child: Stack(
          children: [
            // Main Image

            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(XSizes.productImageRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(XImages.facebook),
                  ),
                ),
              ),
            ),

            // Image Slider

            Positioned(
              right: 0,
              bottom: 30,
              left: XSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: XSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => XRoundedImage(
                    imageUrl: XImages.google,
                    border: Border.all(color: XColors.primary),
                    padding: const EdgeInsets.all(XSizes.sm),
                    backgroundColor: dark ? XColors.dark : XColors.white,
                    width: 80,
                  ),
                ),
              ),
            ),

            // Appbar

            const XAppBar(
              showBackArrow: true,
              actions: [
                XCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
