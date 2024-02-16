import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/shapes/curved_edges/curved_edges.dart';
import 'package:xstore/common/widgets/shapes/curved_edges/curved_edges_widget.dart';
import 'package:xstore/common/widgets/shapes/image_frame/rounded_image.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // Product Image Slider

          children: [
            XClipPathWidget(
              child: Container(
                color: dark ? XColors.grey : XColors.light,
                child: Stack(
                  children: [
                    // Main Image

                    SizedBox(
                      height: 400,
                      child: Padding(
                        padding:
                            const EdgeInsets.all(XSizes.productImageRadius * 2),
                        child: Center(
                          child: Image(
                            image: AssetImage(XImages.yasuo),
                          ),
                        ),
                      ),
                    ),

                    // Image Slider

                    Positioned(
                      bottom: XSizes.appBarHeight,
                      child: Row(
                        children: [
                          XRoundedImage(
                            imageUrl: XImages.google,
                            border: Border.all(color: XColors.primary),
                            padding: const EdgeInsets.all(XSizes.md),
                            backgroundColor:
                                dark ? XColors.dark : XColors.white,
                            width: 80,
                          ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
