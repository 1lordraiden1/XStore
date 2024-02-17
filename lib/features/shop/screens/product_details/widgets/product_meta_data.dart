import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/common/widgets/texts/product_price.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/enums.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XProductMetaData extends StatelessWidget {
  const XProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            XRoundedContainer(
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
            const SizedBox(
              width: XSizes.spaceBtwItems,
            ),
            Text(
              "\$299",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: XSizes.spaceBtwItems,
            ),
            const XProductPrice(price: '199'),
          ],
        ),
        const SizedBox(
          height: XSizes.spaceBtwItems / 1.5,
        ),
        const XProductTitleText(title: "Facebook Inc Company"),
        const SizedBox(
          height: XSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            const XProductTitleText(title: "Status"),
            const SizedBox(
              width: XSizes.spaceBtwItems,
            ),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(
          height: XSizes.spaceBtwItems / 1.5,
        ),
        Row(
          children: [
            XCircularImage(
              width: 40,
              height: 40,
              image: XImages.clothes,
            ),
            const XBrandTitleVerfiedIcon(
              title: 'Meta',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
