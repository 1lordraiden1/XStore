import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/brands/brand_repo.dart';
import 'package:xstore/data/repositories/products/product_repo.dart';
import 'package:xstore/features/shop/models/brand_model.dart';
import 'package:xstore/features/shop/models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepo = Get.put(BrandRepo());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  //  -- Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      isLoading.value = true;

      final brands = await brandRepo.fetchBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      XLoaders.errorSnackBar(message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // -- Get Brands For Category

  Future<List<BrandModel>> getCategoryBrands(String categoryId) async {
    try {
      
      final brands =
          await brandRepo.getCategoryBrands(categoryId: categoryId);

      return brands;
    } catch (e) {
      XLoaders.errorSnackBar(message: e.toString());
      return [];
    }
  }

  // -- Get Brand Specific Products from your data source

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    try {
      final products =
          await ProductRepo.instance.getBrandProducts(brandId: brandId);

      return products;
    } catch (e) {
      XLoaders.errorSnackBar(message: e.toString());
      return [];
    }
  }
}
