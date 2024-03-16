import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/categories/category_repo.dart';
import 'package:xstore/data/repositories/products/product_repo.dart';
import 'package:xstore/features/shop/models/category_model.dart';
import 'package:xstore/features/shop/models/product_model.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;

  final _categoryRepo = Get.put(CategoryRepo());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      // Show loader
      isLoading.value = true;

      // Fetch Categories
      final categories = await _categoryRepo.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(
        categories
            .where(
              (category) => category.isFeatured && category.parentId.isEmpty,
            )
            .take(8)
            .toList(),
      );
    } catch (e) {
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }


  // Get Category of sub products

  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    try {
      final products =
          await ProductRepo.instance.getCategoryProducts(categoryId : categoryId, limit: limit);

      return products;
    } catch (e) {
      XLoaders.errorSnackBar(message: e.toString());
      return [];
    }
  }
}
