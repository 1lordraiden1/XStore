import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  BannerModel({
    this.active = false,
    required this.imageUrl,
    required this.targetScreen,
  });

  final bool active;
  String imageUrl;
  final String targetScreen;

  static BannerModel empty() => BannerModel(imageUrl: "", targetScreen: "");

  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
    };
  }

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      return BannerModel(
        active: data['Active'] ?? false,
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
      );
    } else {
      return BannerModel.empty();
    }
  }
}
