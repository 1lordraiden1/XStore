import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XBottomAddToCart extends StatelessWidget {
  const XBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: XSizes.defaultSpace,
        vertical: XSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
        color: dark ? XColors.darkenGrey : XColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(XSizes.cardRadiusLg),
          topRight: Radius.circular(XSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              XCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: XColors.darkGrey,
                width: 40,
                height: 40,
                color: XColors.white,
              ),
              const SizedBox(
                width: XSizes.spaceBtwItems,
              ),
              Text(
                "1",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: XSizes.spaceBtwItems,
              ),
              XCircularIcon(
                icon: Iconsax.add,
                backgroundColor: XColors.black,
                width: 40,
                height: 40,
                color: XColors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(XSizes.md),
              backgroundColor: XColors.black,
              side: const BorderSide(
                color: XColors.black,
              ),
            ),
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
