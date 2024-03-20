import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/features/shop/models/cart_item_model.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XCartItem extends StatelessWidget {
  const XCartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        // Image
        XRoundedImage(
          imageUrl: item.image ?? '',
          isNetworkImage: true,
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
              XBrandTitleVerfiedIcon(title: item.brandName ?? ''),
              Flexible(
                child: XProductTitleText(
                  title: item.title,
                  maxLines: 1,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: (item.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(children: [
                          TextSpan(
                            text: ' ${e.key} ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          TextSpan(
                            text: ' ${e.value} ',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ]),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
