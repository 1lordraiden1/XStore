import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xstore/features/shop/models/brand_model.dart';
import 'package:xstore/features/shop/models/product_attributes_model.dart';
import 'package:xstore/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  bool? isFeatured;
  String thumnail;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributesModel>? productAttributes;
  List<ProductVariationsModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumnail,
    required this.productType,
    this.sku,
    this.brand,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.date,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0.0,
        thumnail: '',
        productType: '',
      );
/* ProductModel(
        id: '',
        title: '',
        stock: 0,
        price: 0.0,
        thumnail: '',
        productType: '',
        brand: BrandModel.empty(),
        categoryId: '',
        date: DateTime.now(),
        description: '',
        images: [],
        isFeatured: false,
        sku: '',
        salePrice: 0.0,
        productAttributes: [],
        productVariations: [],
      ); */
  toJson() {
    return {
      'Id': id,
      'Title': title,
      'Thumnail': thumnail,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'ProductType': productType,
      'Images': images ?? [],
      'Price': price,
      'Description': description,
      'Stock': stock,
      'SKU': sku,
      'Brand': brand!.toJson(),
      'SalePrice': salePrice,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      sku: data['SKU'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumnail: data['Thumnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributesModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationsModel.fromJson(e))
          .toList(),
    );
  }

  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      sku: data['SKU'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumnail: data['Thumnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributesModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationsModel.fromJson(e))
          .toList(),
    );
  }
}
