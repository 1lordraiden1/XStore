import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/brand/brand_card.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/shapes/containers/search_container.dart';
import 'package:xstore/common/widgets/tabbar/tabbar.dart';
import 'package:xstore/common/widgets/texts/text_heading.dart';
import 'package:xstore/features/shop/controllers/category_contoller.dart';
import 'package:xstore/features/shop/screens/home/widgets/cart_count.dart';
import 'package:xstore/features/shop/screens/shop/widgets/category_tab.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: XAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            XCartCountWidget(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true, // pinning the appbar in the top
                floating: true, // floats the appbar and disapper the details
                backgroundColor: dark ? XColors.black : XColors.white,
                expandedHeight: 450,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(XSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(
                        height: XSizes.spaceBtwItems,
                      ),
                      const XSearchContainer(
                        text: "Search here",
                        icon: Iconsax.search_normal,
                      ),
                      const SizedBox(
                        height: XSizes.spaceBtwSections,
                      ),
                      const XSectionHeading(title: "Featured Items"),
                      const SizedBox(
                        height: XSizes.spaceBtwSections,
                      ),
                      XGridLayout(
                        itemCount: 2,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const XBrandCard(
                            showBorder: true,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: XTabbar(
                  tabs: categories
                      .map(
                        (category) => Tab(
                          child: Text(
                            category.name,
                            //style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map(
                  (category) => XCategoryTab(
                    category: category,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
