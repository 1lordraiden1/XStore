import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XRatingAndShare extends StatelessWidget {
  const XRatingAndShare({
    super.key,
    required this.ratingRank,
    required this.numberOfRates,
  });
  final String ratingRank;
  final String numberOfRates;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Rating
        Row(
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(width: XSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: ratingRank,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(
                    text: '($numberOfRates)',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),

        // Share Button

        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: XSizes.iconMd,
          ),
        ),
      ],
    );
  }
}
