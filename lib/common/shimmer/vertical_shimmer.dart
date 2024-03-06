import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xstore/common/shimmer/shimmer_effect.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XVerticalProductShimmer extends StatelessWidget {
  const XVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return XGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Image
            XShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: XSizes.spaceBtwItems,
            ),
            // Text
            XShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: XSizes.spaceBtwItems / 2,
            ),
            XShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
