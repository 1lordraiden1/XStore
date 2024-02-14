import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';

class XUserProfileTile extends StatelessWidget {
  const XUserProfileTile({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: const XCircularImage(
        width: 45,
        height: 45,
        image: XImages.google,
        padding: 0,
      ),
      title: Text(
        "Account",
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: XColors.white,
            ),
      ),
      subtitle: Text(
        "Account",
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: XColors.white,
            ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Iconsax.edit,
          color: XColors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
