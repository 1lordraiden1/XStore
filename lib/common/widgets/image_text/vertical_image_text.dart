import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XVerticalImageText extends StatelessWidget {
  const XVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = XColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImg = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImg;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          // Circular Icon
          Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(XSizes.sm),
            decoration: BoxDecoration(
              color:
                  backgroundColor ?? (dark ? XColors.black : XColors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: XCircularImage(
                image: image,
                fit: BoxFit.fitWidth,
                padding: XSizes.sm * 1.4,
                isNetworkImg: isNetworkImg,
                overlayColor: dark ? XColors.white : XColors.dark,
                backgroundColor: backgroundColor,
              ),
            ),
          ),
    
          const SizedBox(
            height: XSizes.spaceBtwItems / 2,
          ),
    
          // Text
    
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
