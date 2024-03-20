import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/loaders/animation_loader.dart';
import 'package:xstore/features/shop/controllers/product/cart_controller.dart';
import 'package:xstore/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:xstore/features/shop/screens/cart/widgets/checkout.dart';
import 'package:xstore/features/shop/screens/home/home.dart';
import 'package:xstore/navigation_menu.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: XAppBar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          XCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(
              const HomeScreen(),
            ),
          ),
        ],
      ),
      body: Obx(
        () {
          final emptyWidget = XAnimationLoaderWidget(
            text: "Oops! Cart is EMPTY",
            animation: XImages.googleLoading1,
            showAction: true,
            actionText: 'Lets\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(XSizes.defaultSpace),
                child: XCartItems(),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: Obx(
        () => controller.cartItems.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(
                  left: XSizes.defaultSpace,
                  right: XSizes.defaultSpace,
                  bottom: XSizes.defaultSpace,
                ),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Text(
                    "Checkout \$${controller.totalCartPrice.value}",
                  ),
                ),
              ),
      ),
    );
  }
}
