import 'package:get/get.dart';
import 'package:xstore/features/shop/controllers/product/product_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';

class XSearchController extends GetxController {
  static XSearchController get instance => Get.find();

  RxBool isSearching = false.obs;
  
  final List<ProductModel> products = ProductController.instance.allProducts;
  RxList<ProductModel> display_list = <ProductModel>[].obs;

  @override
  void onInit() {
    display_list.assignAll(products);
    super.onInit();
  }

  void updateList(String value) {
   
      display_list.assignAll(
        products
            .where(
              (element) => element.title.toLowerCase().contains(
                    value.toLowerCase(),
                  ),
            )
            .toList(),
      );
       
    refresh();
  }
}
