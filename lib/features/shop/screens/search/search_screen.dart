import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:xstore/features/shop/controllers/search_controller.dart';
import 'package:xstore/utils/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = XSearchController.instance;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          XSizes.defaultSpace,
        ),
        child: Obx(
          ()=> Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => searchController.updateList(value),
                decoration: InputDecoration(
                  hintText: "Search here",
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  prefixIcon: IconButton(
                    icon: const Icon(Iconsax.arrow_left),
                    onPressed: () => Get.back(),
                  ),
                ),
              ),
              Expanded(
                child: 
                searchController.display_list.isNotEmpty ? 
                 ListView.builder(
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemCount: searchController.display_list.isEmpty
                      ? searchController.products.length
                      : searchController.display_list.length,
                  itemBuilder: (_, index) => XProductCardHorizontal(
                    product: searchController.display_list[index],
                  )
                )  : Center(child: Text("Not Found"),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
