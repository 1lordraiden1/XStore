import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/grid/grid_layout.dart';
import 'package:xstore/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/sizes.dart';

class XSortableProducts extends StatelessWidget {
  const XSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(items: ['Name' , 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem( value: option,child: Text(option))).toList(), onChanged: (value){},),
        const SizedBox(height: XSizes.spaceBtwSections,),

        XGridLayout(itemCount: 4, itemBuilder: (_, index)=> XProductCardVertical(product: ProductModel.empty(),),),
      ],
    );
  }
}