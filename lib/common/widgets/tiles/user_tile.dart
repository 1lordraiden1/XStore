import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/images/circular_image.dart';
import 'package:xstore/features/personalization/controllers/user_controller.dart';
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
    final conroller = UserController.instance;
    return ListTile(
      onTap: onPressed,
      leading: const XCircularImage(
        width: 45,
        height: 45,
        image: XImages.google,
        padding: 0,
      ),
      title: Text(
        conroller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: XColors.white,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      subtitle: Text(
        conroller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: XColors.white,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
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
