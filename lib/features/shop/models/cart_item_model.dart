import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  String productId;
  String title;
  String? image;
  int quantity;
  double price;
  String variationId;
  String? brandName;
  Map<String, String>? selectedVariation;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId = '',
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brandName,
    this.selectedVariation,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  toJson() {
    return {
      'productId': productId,
      'title': title,
      'image': image,
      'quantity': quantity,
      'price': price,
      'variationId': variationId,
      'brandName': brandName,
      'selectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return CartItemModel.empty();

    return CartItemModel(
      productId: data['productId'],
      quantity: data['quantity'],
      title: data['title'],
      brandName: data['brandName'],
      image: data['image'],
      price: data['price'],
      selectedVariation: data['selectedVariation'],
      variationId: data['variationId'],
    );
  }

  factory CartItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return CartItemModel(
        productId: data['productId'] ?? '',
        quantity: data['quantity'] ?? 0,
        brandName: data['brandName'] ?? '',
        image: data['image'] ?? '',
        price: data['price'] ?? 0.0,
        selectedVariation: data['selectedVariation'] ?? {},
        title: data['title'] ?? '',
        variationId: data['variationId'] ?? '',
      );
    } else {
      return CartItemModel.empty();
    }
  }
}
