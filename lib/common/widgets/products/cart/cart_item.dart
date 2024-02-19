import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XCartItem extends StatelessWidget {
  const XCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        XRoundedImage(
          imageUrl: XImages.google,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(XSizes.md),
          backgroundColor: dark ? XColors.darkenGrey : XColors.light,
        ),

        const SizedBox(
          width: XSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const XBrandTitleVerfiedIcon(title: "Google"),
              const Flexible(
                child: XProductTitleText(
                  title: "T-Shirt White",
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Color",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Green",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "Size",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "UK 08",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
