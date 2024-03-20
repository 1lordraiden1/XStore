import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/features/shop/controllers/product/cart_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XBottomAddToCart extends StatelessWidget {
  const XBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = XHelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: XSizes.defaultSpace,
        vertical: XSizes.defaultSpace,
      ),
      decoration: BoxDecoration(
        color: dark ? XColors.darkenGrey : XColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(XSizes.cardRadiusLg),
          topRight: Radius.circular(XSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                XCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: XColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: XColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: XSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: XSizes.spaceBtwItems,
                ),
                XCircularIcon(
                  icon: Iconsax.add,
                  backgroundColor: XColors.black,
                  width: 40,
                  height: 40,
                  color: XColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  :  () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(XSizes.md),
                backgroundColor: XColors.black,
                side: const BorderSide(
                  color: XColors.black,
                ),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
