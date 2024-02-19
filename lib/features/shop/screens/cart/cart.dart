import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/icons/brand_title_icon.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/products/cart/add_remove.dart';
import 'package:xstore/common/widgets/products/cart/cart_item.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/common/widgets/texts/product_price.dart';
import 'package:xstore/common/widgets/texts/product_text_title.dart';
import 'package:xstore/features/shop/screens/home/home.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(
              height: XSizes.spaceBtwItems,
            ),
            itemBuilder: (_, index) => const Column(
              children: [
                XCartItem(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 65,
                        ),
                        XProductQuantitiyWithAddRemove(),
                      ],
                    ),
                    XProductPrice(price: "399.99"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: XSizes.defaultSpace,
          right: XSizes.defaultSpace,
          bottom: XSizes.defaultSpace,
        ),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Checkout \$1999.99"),
        ),
      ),
    );
  }
}
