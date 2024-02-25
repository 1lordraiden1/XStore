import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:xstore/common/shimmer/shimmer_effect.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/features/personalization/controllers/user_controller.dart';
import 'package:xstore/features/shop/screens/home/widgets/cart_count.dart';
import 'package:xstore/utils/constants/colors.dart';

class XHomeAppBarWidget extends StatelessWidget {
  const XHomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    // final user = Get.put(UserModel.fromSnapshot(controller.instance.userRepo.))
    return XAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to the store",
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: XColors.grey,
                ),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const XShimmerEffect(width: 80, height: 15);
            } else {
              return Text(
              controller.instance.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: XColors.white),
            );
            }
            
          }),
        ],
      ),
      actions: const [
        XCartCountWidget(),
      ],
    );
  }
}
