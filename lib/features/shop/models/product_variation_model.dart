class ProductVariationsModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributesValues;

  ProductVariationsModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    this.description = '',
    required this.attributesValues,
  });

  static ProductVariationsModel empty() => ProductVariationsModel(
        id: '',
        attributesValues: {},
      );

  toJson() {
    return {
      'Id': id,
      'Image': image,
      'Price': price,
      'Description': description,
      'Stock': stock,
      'SKU': sku,
      'AttributeValues': attributesValues,
      'SalePrice': salePrice,
    };
  }

  factory ProductVariationsModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductVariationsModel.empty();

    return ProductVariationsModel(
      id: data['Id'] ?? '',
      sku: data['SKU'] ?? '',
      image: data['Image'] ?? '',
      stock: data['Stock'] ?? 0,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      attributesValues: Map<String, String>.from(data['AttributeValues']),
    );
  }
}
