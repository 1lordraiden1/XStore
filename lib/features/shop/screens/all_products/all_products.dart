import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/shimmer/vertical_shimmer.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/features/shop/controllers/product/all_products_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/features/shop/screens/all_products/sortable_products.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/cloud_helper_functions.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod,});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return  Scaffold(
      appBar: XAppBar(title: Text(title),),
      body:SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(XSizes.defaultSpace),child: FutureBuilder(
        future: futureMethod ?? controller.fetchProductByQuery(query), // FirebaseFirestore.instance.collection('Products').where('IsFeatured', isEqualTo: true).limit(6)
        builder: (context, snapshot) {

          const loader = XVerticalProductShimmer();
          final widget = XCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

          if (widget != null) return widget;

          final products = snapshot.data!;
          return XSortableProducts(products: products,);

        }
      ),),),
    );
  }
}