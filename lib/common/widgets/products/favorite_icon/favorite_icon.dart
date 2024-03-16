import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/features/shop/controllers/product/favorite_controller.dart';
import 'package:xstore/utils/constants/colors.dart';

class XFavoriteIcon extends StatelessWidget {
  const XFavoriteIcon({
    super.key, required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Obx(
      () =>  XCircularIcon(
        icon: controller.isFavorite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavorite(productId) ? XColors.error : null,
        onPressed:  ()=> controller.toggleFavProduct(productId),
      ),
    );
  }
}