import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/features/shop/screens/wishlist/wishlist.dart';

class XFavoriteIcon extends StatelessWidget {
  const XFavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return const XCircularIcon(
      icon: Iconsax.heart5,
      color: Colors.red,
    );
  }
}