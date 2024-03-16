import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/shimmer/vertical_shimmer.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/loaders/animation_loader.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/features/shop/controllers/product/favorite_controller.dart';
import 'package:xstore/features/shop/screens/home/home.dart';
import 'package:xstore/navigation_menu.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/cloud_helper_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteController.instance;
    return Scaffold(
      appBar: XAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                ()=> FutureBuilder(
                    future: controller.favoriteProducts(),
                    builder: (context, snapshot) {
                      // Nothing found widget =>
                      final emptyWidget = XAnimationLoaderWidget(
                        text: 'oops! Wishlist is Empty...',
                        animation: XImages.googleLoading1,
                        showAction: true,
                        actionText: 'Let\'s add some',
                        onActionPressed: () => Get.off(
                          () => const NavigationMenu(),
                        ),
                      );
                      const loader = XVerticalProductShimmer(
                        itemCount: 6,
                      );
                      final widget = XCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: emptyWidget,
                      );
                      if (widget != null) return widget;
                      final products = snapshot.data!;
                      return XGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) => XProductCardVertical(
                          product: products[index],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
