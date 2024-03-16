import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/shimmer/shimmer_effect.dart';
import 'package:xstore/common/widgets/brand/brand_card.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/features/shop/models/brand_model.dart';
import 'package:xstore/features/shop/screens/all_products/brand_products.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XBrandShowCase extends StatelessWidget {
  const XBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: XRoundedContainer(
        showBorder: true,
        borderColor: XColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(XSizes.md),
        margin: const EdgeInsets.only(bottom: XSizes.spaceBtwItems),
        child: Column(
          children: [
            // Brand
            XBrandCard(
              brand: brand,
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
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, progress) =>
              const XShimmerEffect(width: 100, height: 100),
              errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
