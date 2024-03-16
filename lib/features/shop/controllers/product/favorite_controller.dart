import 'dart:convert';

import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/products/product_repo.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/local_storage/storage_utility.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    
    super.onInit();
    initFavorites();
  }

  // Init favorites

  Future<void> initFavorites() async {
    final json = XLocalStorage.instance().readData('favorites');

    if (json != null){
      final storedFav = jsonDecode(json) as Map<String, dynamic>;

      favorites.assignAll(storedFav.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavProduct(String productId) {
    if (!favorites.containsKey(productId)){
      favorites[productId] = true;
      saveFavToStorage();
      XLoaders.successSnackBar(title: 'Great!', message: 'item has been added to wishlist successfully');
    } else {
      XLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavToStorage();
      favorites.refresh();
      XLoaders.successSnackBar(title: 'Great!', message: 'item has been removed from wishlist successfully');
    }
  }

  void saveFavToStorage() {
    final encodedFav = json.encode(favorites);
    XLocalStorage.instance().saveData('favorites', encodedFav);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepo.instance.getFavProducts(favorites.keys.toList());
  }


}