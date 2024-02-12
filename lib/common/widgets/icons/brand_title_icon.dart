import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/enums.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XBrandTitleVerfiedIcon extends StatelessWidget {
  const XBrandTitleVerfiedIcon({
    super.key,
    required this.title,
    this.textColor,
    this.iconColor = XColors.primary,
    this.maxLines = 1,
    this.brandTextSize = TextSizes.small,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final Color? textColor, iconColor;
  final int maxLines;
  final TextSizes brandTextSize;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: XBrandTitleText(
            title: title,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
            maxLines: maxLines,
            textColor: textColor,
          ),
        ),
        const SizedBox(
          width: XSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: XSizes.iconXs,
        ),
      ],
    );
  }
}

class XBrandTitleText extends StatelessWidget {
  const XBrandTitleText({
    super.key,
    required this.title,
    this.textColor,
    required this.maxLines,
    required this.textAlign,
    required this.brandTextSize,
  });

  final String title;
  final Color? textColor;
  final int maxLines;
  final TextAlign textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: textColor)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: textColor)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: textColor),
      textAlign: textAlign,
    );
  }
}
