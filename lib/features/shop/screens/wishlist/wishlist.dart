import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/features/shop/screens/home/home.dart';
import 'package:xstore/utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              XGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const XProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
