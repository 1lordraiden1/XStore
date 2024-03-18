import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/utils/constants/colors.dart';

class XLoaders {
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: XColors.white,
      backgroundColor: XColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Iconsax.check,
        color: XColors.white,
      ),
    );
  }

  static errorSnackBar({title = "Oh no!" , required message, duration = 3}) {
    //
    Get.snackbar(
      title ,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: XColors.white,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Iconsax.warning_2,
        color: Colors.white,
      ),
    );
  }

  static warningSnackBar({ title = 'Oh Snap!' , message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: XColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(20),
      icon: const Icon(
        Iconsax.warning_2,
        color: XColors.white,
      ),
    );
  }
}
