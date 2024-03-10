import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/chips/choice_chip.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/common/widgets/texts/product_price.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XProductAttributes extends StatelessWidget {
  const XProductAttributes({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    
    return Column(
      children: [
        XRoundedContainer(
          padding: const EdgeInsets.all(XSizes.md),
          backgroundColor: dark ? XColors.darkenGrey : XColors.grey,
          child: Column(
            children: [
              // Title
              Wrap(
                children: [
                  const XSectionHeading(title: "Variation"),
                  const SizedBox(
                    width: XSizes.spaceBtwItems,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const XProductTitleText(
                            title: "Price : ",
                            smallSize: true,
                          ),
                          Text(
                            "\$25.99",
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(
                            width: XSizes.spaceBtwItems,
                          ),
                          const XProductPrice(price: "20.99"),
                        ],
                      ),
                      Row(
                        children: [
                          const XProductTitleText(title: "Stock : "),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const XProductTitleText(
                title:
                    "This is the description of the product and it can go upto max 4 lines",
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: XSizes.spaceBtwItems,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: product.productAttributes!
              .map(
                (attribute) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    XSectionHeading(title: attribute.name ?? ''),
                    const SizedBox(
                      height: XSizes.spaceBtwItems,
                    ),
                    Wrap(
                      spacing: 8,
                      children: attribute.values!
                          .map(
                            (value) => XChoiceChip(
                              selected: false,
                              text: value,
                              onSelected: (value) {},
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: XSizes.spaceBtwItems,
        ),
      ],
    );
  }
}
