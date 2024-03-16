import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/common/widgets/icons/circular_icon.dart';
import 'package:xstore/common/widgets/products/favorite_icon/favorite_icon.dart';
import 'package:xstore/common/widgets/shapes/curved_edges/curved_edges_widget.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/features/shop/controllers/product/images_controller.dart';
import 'package:xstore/features/shop/models/product_model.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XProductImageSlider extends StatelessWidget {
  const XProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());

    final images = controller.getAllProductImages(product);

    return XClipPathWidget(
      child: Container(
        color: dark ? XColors.grey : XColors.light,
        child: Stack(
          children: [
            // Main Image

            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(XSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(
                    () {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: ()=> controller.showEnlargedImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (_, __, progress) =>
                              CircularProgressIndicator(
                            value: progress.progress,
                            color: XColors.primary,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            // Image Slider

            Positioned(
              right: 0,
              bottom: 30,
              left: XSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: XSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final imageSelected =
                          controller.selectedProductImage.value ==
                              images[index];
                      return XRoundedImage(
                        isNetworkImage: true,
                        imageUrl: images[index],
                        border: Border.all(
                          color: imageSelected
                              ? XColors.primary
                              : Colors.transparent,
                        ),
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        padding: const EdgeInsets.all(XSizes.sm),
                        backgroundColor: dark ? XColors.dark : XColors.white,
                        width: 80,
                      );
                    },
                  ),
                ),
              ),
            ),

            // Appbar

            const XAppBar(
              showBackArrow: true,
              actions: [
                XFavoriteIcon(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
