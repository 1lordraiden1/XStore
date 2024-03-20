import 'package:get/get.dart';
import 'package:xstore/features/shop/controllers/product/cart_controller.dart';
import 'package:xstore/features/shop/controllers/product/images_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/features/shop/models/product_variation_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationsModel> selectedVariation =
      ProductVariationsModel.empty().obs;

  void onAttributeSelected( // sAvailabilityInVariation List<ProductVariationsModel> variation
      ProductModel product, String attributeName , String attributeValue) {
        final selectedAttributes = Map<String, dynamic>.from(this.selectedAttributes);

        selectedAttributes[attributeName] = attributeValue;
        this.selectedAttributes[attributeName] = attributeValue;

        final selectedVariation = product.productVariations!.firstWhere((variation) => _isSameAttributeValues(variation.attributesValues, selectedAttributes), orElse: ()=> ProductVariationsModel.empty(),);

        // Show the selected one image as the main one =>
        if (selectedVariation.image.isNotEmpty){
          ImagesController.instance.selectedProductImage.value = selectedVariation.image;
        }

        if(selectedVariation.id.isNotEmpty) {
          final cartController = CartController.instance;
          cartController.productQuantityInCart.value = cartController.getVariationQuantityInCart(product.id, selectedVariation.id);
        }

        this.selectedVariation.value = selectedVariation;

        getProductVariationStockStatus();
      }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes){

    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys){
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }
    return true;
  }
 
  Set<String?> getAttributesAvailabilityVariation(List<ProductVariationsModel> variations , String attributeName) {
    final availableVariations = variations.where((variation) => variation.attributesValues[attributeName] != null && variation.attributesValues[attributeName]!.isNotEmpty && variation.stock > 0).map((variation) => variation.attributesValues[attributeName]).toSet();

    return availableVariations;
  }
  void getProductVariationStockStatus() {
    variationStockStatus.value =
        selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  String getVariationPrice(){
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price).toString();
  }

  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationsModel.empty();
  }
}
