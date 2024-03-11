import 'package:get/get.dart';
import 'package:xstore/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationsModel> selectedVariation =
      ProductVariationsModel.empty().obs;

  void onAttributesAvailabilityInVariation(
      List<ProductVariationsModel> variation, String attributeName) {}

  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationsModel.empty();
  }
}
