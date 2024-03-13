import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/brand/brand_card.dart';
import 'package:xstore/features/shop/screens/all_products/sortable_products.dart';
import 'package:xstore/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: XAppBar( title:  Text('Google'),),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(XSizes.defaultSpace),
         child: Column(
          children: [
            XBrandCard(),
            SizedBox(height: XSizes.spaceBtwSections,),

            XSortableProducts(products: [],),
          ],
         ),
        ),
      ),
    );
  }
}