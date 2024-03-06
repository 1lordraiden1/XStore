import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/products/product_repo.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/enums.dart';

class ProductController extends GetxController {
  ProductController get instance => Get.find();

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  final isLoading = false.obs;
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  final _productRepo = Get.put(ProductRepo());

  Future<void> fetchFeaturedProducts() async {
    try {
      // Show loader
      isLoading.value = true;

      // Fetch Products
      final products = await _productRepo.getFeaturedProducts();

      // Update the products list
      featuredProducts.assignAll(products);

      // Filter featured products
      /*
      featuredProducts.assignAll(
        products
            .where(
              (product) => product.isFeatured! && product.id.isEmpty,
            )
            .take(4)
            .toList(),
      );*/
    } catch (e) {
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largetsPrice = 0.0;

    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider =
            variation.salePrice > 0 ? variation.salePrice : variation.price;

        if (priceToConsider < smallestPrice) {
          smallestPrice - priceToConsider;
        }

        if (priceToConsider > largetsPrice) {
          largetsPrice - priceToConsider;
        }
      }

      if (smallestPrice.isEqual(largetsPrice)) {
        return largetsPrice.toString();
      } else {
        return '$smallestPrice - \$$largetsPrice';
      }
    }
  }

  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'InStock' : 'Out of Stock';
  }
}
