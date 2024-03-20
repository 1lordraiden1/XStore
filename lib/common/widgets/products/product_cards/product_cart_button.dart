import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/features/shop/controllers/product/cart_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/features/shop/screens/product_details/prodcut_detail.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/enums.dart';
import 'package:xstore/utils/constants/sizes.dart';

class ProductAddToCartButton extends StatelessWidget {
  const ProductAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailScreen(product: product));
        }
      },
      child: Obx(
        () {
          final productQuantity =
              cartController.getProductQuantityInCart(product.id);
          return Container(
            decoration: BoxDecoration(
              color: productQuantity > 0 ? XColors.primary : XColors.dark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(XSizes.cardRadiusMd),
                bottomRight: Radius.circular(
                  XSizes.productImageRadius,
                ),
              ),
            ),
            child: SizedBox(
              width: XSizes.iconLg * 1.2,
              height: XSizes.iconLg * 1.2,
              child: Center(
                child: productQuantity > 0
                    ? Text(
                        productQuantity.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .apply(color: XColors.white),
                      )
                    : const Icon(
                        Iconsax.add,
                        color: XColors.white,
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
