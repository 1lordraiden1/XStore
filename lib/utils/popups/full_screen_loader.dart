import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/widgets/loaders/animation_loader.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class XFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get
          .overlayContext!, // gets the context of the overlay children (dialogs)
      barrierDismissible: false, // not dissmissed by tapping outside it
      builder: (_) => Container( // !! Need to add PopScope !! 
        color: XHelperFunctions.isDarkMode(Get.context!)
            ? XColors.dark
            : XColors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 250,
            ),
            XAnimationLoaderWidget(text: text, animation: animation)
          ],
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
