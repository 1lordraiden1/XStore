import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  BrandCategoryModel({required this.brandId, required this.categoryId});

  final String brandId;
  final String categoryId;

  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'categoryId': categoryId,
    };
  }

  factory BrandCategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data() as Map<String, dynamic>;
    return BrandCategoryModel(
      brandId: data['brandId'] as String,
      categoryId: data['categoryId'] as String,
    );
  }
}
