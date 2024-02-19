import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XProductQuantitiyWithAddRemove extends StatelessWidget {
  const XProductQuantitiyWithAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const XCircularIcon(
          size: 15,
          icon: Iconsax.minus,
          backgroundColor: XColors.darkGrey,
          width: 30,
          height: 30,
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
        const XCircularIcon(
          size: 15,
          icon: Iconsax.add,
          backgroundColor: XColors.primary,
          width: 30,
          height: 30,
          color: XColors.white,
        ),
      ],
    );
  }
}
