
class ProductAttributesModel {
  String? name;
  final List<String>? values;

  ProductAttributesModel({this.values, this.name});

  toJson() {
    return {'Name': name, 'Values': values};
  }

  factory ProductAttributesModel.fromJson(Map<String, dynamic> document) {
    final data = document;

    if (data.isEmpty) return ProductAttributesModel();

    return ProductAttributesModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
