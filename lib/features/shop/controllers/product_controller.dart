import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/products/product_repo.dart';
import 'package:xstore/features/shop/models/product_model.dart';

class ProductController extends GetxController {
  ProductController get instance => Get.find();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  final isLoading = false.obs;
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  final _productRepo = Get.put(ProductRepo());

  Future<void> fetchProducts() async {
    try {
      // Show loader
      isLoading.value = true;

      // Fetch Products
      final products = await _productRepo.getAllProducts();

      // Update the products list
      allProducts.assignAll(products);

      // Filter featured products
      featuredProducts.assignAll(
        products
            .where(
              (product) => product.isFeatured! && product.id.isEmpty,
            )
            .take(4)
            .toList(),
      );
    } catch (e) {
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
