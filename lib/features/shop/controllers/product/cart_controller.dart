import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/features/shop/controllers/product/variation_controller.dart';
import 'package:xstore/features/shop/models/cart_item_model.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/features/shop/screens/cart/cart.dart';
import 'package:xstore/utils/constants/enums.dart';
import 'package:xstore/utils/local_storage/storage_utility.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController() {
    loadCartItems();
  }

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

    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    updateCart();

    XLoaders.successSnackBar(
        title: 'Great!', message: 'Your Product has been added to the cart');
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((element) =>
        element.productId == item.productId &&
        element.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product ?',
      onConfirm: () {
        // Remove the item
        cartItems.removeAt(index);
        updateCart();
        XLoaders.successSnackBar(
            title: "Done", message: 'Product removed from cart');
            Get.off(() => const CartScreen());
         //Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if (product.productType == ProductType.single.toString()) {
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      final variationId = variationController.selectedVariation.value.id;
      if (variationId.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationId);
      } else {
        productQuantityInCart.value = 0;
      }
    }
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

  void updateCartTotals() {
    double calcTotalPrice = 0.0;
    int calcNoOfItems = 0;

    for (var item in cartItems) {
      calcTotalPrice += (item.price) * item.quantity.toDouble();
      calcNoOfItems += item.quantity;
    }

    totalCartPrice.value = calcTotalPrice;
    noOfCartItems.value = calcNoOfItems;
  }

  void saveCartItems() {
    final cartItemsString =
        cartItems.map((element) => element.toJson()).toList();
    XLocalStorage.instance().saveData('cartItems', cartItemsString);
  }

  void loadCartItems() {
    final cartItemsString =
        XLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemsString != null) {
      cartItems.assignAll(
        cartItemsString.map(
          (e) => CartItemModel.fromJson(e as Map<String, dynamic>),
        ),
      );
      updateCartTotals();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems.where((e) => e.productId == productId).fold(
          0,
          (
            previousValue,
            element,
          ) =>
              previousValue + element.quantity,
        );
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
      (e) => e.productId == productId && e.variationId == variationId,
      orElse: () => CartItemModel.empty(),
    );

    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
