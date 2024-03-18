import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/features/shop/controllers/product/variation_controller.dart';
import 'package:xstore/features/shop/models/cart_item_model.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/enums.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  void addToCart(ProductModel product) {
    // Quantity check
    if (productQuantityInCart.value < 1) {
      XLoaders.warningSnackBar(message: "Select Quantity");
      return;
    }

    // Variation selected

    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      XLoaders.warningSnackBar(message: "Select Variation");
      return;
    }

    // Out of stock

    if (product.productType == ProductType.variable.toString()) {
      if (variationController.selectedVariation.value.stock < 1) {
        XLoaders.warningSnackBar(message: "Selected Variation is out of stock");
        return;
      }
    } else {
      if (product.stock < 1) {
        XLoaders.warningSnackBar(message: "Selected Product is out of stock");
        return;
      }
    }

    // convert

    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere(
      (cartItem) =>
          cartItem.productId == selectedCartItem.productId &&
          cartItem.variationId == selectedCartItem.variationId,
    );

    if (index >= 0){
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);

    }

    updateCart();

    XLoaders.successSnackBar(title: 'Great!' , message: 'Your Product has been added to the cart');

  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }

    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      title: product.title,
      price: price,
      variationId: variation.id,
      image: product.thumnail,
      brandName: product.brand!.name,
      selectedVariation: isVariation ? variation.attributesValues : null,
    );
  }

  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  updateCartTotals() {}

  saveCartItems() {}
}
