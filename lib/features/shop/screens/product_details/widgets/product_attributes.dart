import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XProductAttributes extends StatelessWidget {
  const XProductAttributes({super.key});

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
              Row(
                children: [
                  XSectionHeading(title: "Variation"),
                  SizedBox(
                    width: XSizes.spaceBtwItems,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$25.99",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough,),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
