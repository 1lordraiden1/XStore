import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/common/widgets/shapes/containers/rounded_container.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XBrandCard extends StatelessWidget {
  const XBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: XRoundedContainer(
        padding: const EdgeInsets.all(XSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: XCircularImage(
                image: XImages.facebook,
                overlayColor: dark ? XColors.white : XColors.black,
                height: 56,
                width: 56,
              ),
            ),
            const SizedBox(
              height: XSizes.spaceBtwItems,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const XBrandTitleVerfiedIcon(title: "FaceBook"),
                  Text(
                    "52 Products",
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
