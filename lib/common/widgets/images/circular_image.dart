import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:xstore/common/shimmer/shimmer_effect.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XCircularImage extends StatelessWidget {
  const XCircularImage({
    super.key,
    required this.width,
    required this.height,
    this.padding = XSizes.sm,
    required this.image,
    this.isNetworkImg = false,
    this.overlayColor,
    this.backgroundColor = Colors.transparent,
    this.fit,
  });

  final double width, height, padding;
  final String image;
  final bool isNetworkImg;
  final Color? overlayColor, backgroundColor;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? XColors.black : XColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImg
              ? CachedNetworkImage(
                  imageUrl: image,
                  fit: fit,
                  color: overlayColor,
                  progressIndicatorBuilder: (context, url, progress) =>
                      const XShimmerEffect(width: 55, height: 55),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: isNetworkImg
                      ? NetworkImage(image)
                      : AssetImage(image) as ImageProvider,
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
