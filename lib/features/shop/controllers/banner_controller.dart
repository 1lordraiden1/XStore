import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/loaders.dart';
import 'package:xstore/data/repositories/banners/banners_repo.dart';
import 'package:xstore/features/shop/models/banner_model.dart';

class BannerController extends GetxController {
  BannerController get instance => Get.find();

  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanners() async {
    try {
      // Show loader
      isLoading.value = true;

      // Fetch Banners

      final bannerRepo = Get.put(BannerRepo());

      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);
    } catch (e) {
      XLoaders.errorSnackBar(title: "Oh no!", message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
