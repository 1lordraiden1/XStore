import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/widgets/products/cart/add_remove.dart';
import 'package:xstore/common/widgets/products/cart/cart_item.dart';
import 'package:xstore/common/widgets/texts/product_price.dart';
import 'package:xstore/features/shop/controllers/product/cart_controller.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XCartItems extends StatelessWidget {
  const XCartItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: controller.cartItems.length,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, __) => const SizedBox(
          height: XSizes.spaceBtwItems,
        ),
        itemBuilder: (_, index) => Obx(
          () {
            final item = controller.cartItems[index];
            return Column(
              children: [
                XCartItem(
                  item: item,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 65,
                        ),
                        XProductQuantityWithAddRemove(
                          quantity: item.quantity,
                          add: () => controller.addOneToCart(item),
                          remove: () => controller.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    XProductPrice(
                      price: (item.price * item.quantity).toStringAsFixed(1),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
