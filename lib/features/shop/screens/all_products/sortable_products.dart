import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/features/shop/controllers/product/all_products_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XSortableProducts extends StatelessWidget {
  const XSortableProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort),) ,items: ['Name' , 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem( value: option,child: Text(option))).toList(),
          value: controller.selectedSortOption.value,
          onChanged: (value){
            controller.sortProducts(value!);
          },
        ),
        const SizedBox(height: XSizes.spaceBtwSections,),

        Obx(()=> XGridLayout(itemCount: controller.products.length, itemBuilder: (_, index)=> XProductCardVertical(product: controller.products[index],),)),
      ],
    );
  }
}