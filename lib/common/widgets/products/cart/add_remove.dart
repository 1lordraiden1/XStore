import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XProductQuantityWithAddRemove extends StatelessWidget {
  const XProductQuantityWithAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        XCircularIcon(
          size: 15,
          icon: Iconsax.minus,
          backgroundColor: dark ? XColors.darkenGrey : XColors.light,
          width: 30,
          height: 30,
          color: dark ? XColors.white : XColors.black,
          onPressed: remove,
        ),
        const SizedBox(
          width: XSizes.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: XSizes.spaceBtwItems,
        ),
        XCircularIcon(
          size: 15,
          icon: Iconsax.add,
          backgroundColor: XColors.primary,
          width: 30,
          height: 30,
          color: XColors.white,
          onPressed: add,
        ),
      ],
    );
  }
}
