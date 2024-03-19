import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/features/shop/controllers/product/cart_controller.dart';
import 'package:xstore/features/shop/screens/cart/cart.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XCartCountWidget extends StatelessWidget {
  const XCartCountWidget({
    super.key,
    this.iconColor = XColors.white,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? XColors.white : XColors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                controller.cartItems.length.toString(),
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: counterTextColor ??
                          (dark ? XColors.black : XColors.white),
                      fontSizeFactor: 0.7,
                    ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
