import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/features/shop/screens/all_products/sortable_products.dart';
import 'package:xstore/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: XAppBar(title: Text("Popular Products"),),
      body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(XSizes.defaultSpace),child: XSortableProducts(),),),
    );
  }
}