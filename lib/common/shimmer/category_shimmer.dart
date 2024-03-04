import 'package:flutter/material.dart';
import 'package:xstore/common/shimmer/shimmer_effect.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XCategoryShimmer extends StatelessWidget {
  const XCategoryShimmer({
    super.key,
    this.itemCount = 8,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              XShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: XSizes.spaceBtwItems / 2,
              ),
              XShimmerEffect(
                width: 55,
                height: 8,
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: XSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
      ),
    );
  }
}
