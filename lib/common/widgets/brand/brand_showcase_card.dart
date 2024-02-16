import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/brand/brand_card.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XBrandShowCase extends StatelessWidget {
  const XBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return XRoundedContainer(
      showBorder: true,
      borderColor: XColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(XSizes.md),
      margin: const EdgeInsets.only(bottom: XSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand
          const XBrandCard(
            showBorder: false,
          ),
          const SizedBox(
            height: XSizes.spaceBtwItems,
          ),
          // 3 Products of them
          Row(
            children:
                images.map((image) => brandImages(image, context)).toList(),
          ),
        ],
      ),
    );
  }

  Widget brandImages(String image, context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Expanded(
      child: XRoundedContainer(
        height: 100,
        backgroundColor: dark ? XColors.darkenGrey : XColors.white,
        margin: const EdgeInsets.only(right: XSizes.sm),
        padding: const EdgeInsets.all(XSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
