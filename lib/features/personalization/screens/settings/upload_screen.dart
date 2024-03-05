import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/tiles/setting_tile.dart';
import 'package:xstore/data/dummy/dummy_data.dart';
import 'package:xstore/data/repositories/banners/banners_repo.dart';
import 'package:xstore/data/repositories/categories/category_repo.dart';
import 'package:xstore/utils/constants/sizes.dart';

class UploadOptionsScreen extends StatelessWidget {
  const UploadOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final initCategories = XDummyData.categories;
    final initBanners = XDummyData.banners;
    return Scaffold(
      appBar: XAppBar(
        title: Text("Upload Options"),
      ),
      body: Column(
        children: [
          XSettingMenuTile(
            icon: Iconsax.security_card,
            title: "Upload Categories",
            subtitle: "Manage Data",
            onTap: () => CategoryRepo.instance.uploadDummyData(initCategories),
          ),
          const SizedBox(
            height: XSizes.spaceBtwItems,
          ),
          XSettingMenuTile(
            icon: Iconsax.image,
            title: "Upload Banners",
            subtitle: "Manage Data",
            onTap: () => BannerRepo.instance.uploadDummyData(initBanners),
          ),
        ],
      ),
    );
  }
}
