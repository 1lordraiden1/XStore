import 'package:flutter/material.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/features/shop/screens/home/widgets/cart_count.dart';
import 'package:xstore/utils/constants/colors.dart';

class XHomeAppBarWidget extends StatelessWidget {
  const XHomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
 
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
          Text(
            '',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: XColors.white),
          ),
        ],
      ),
      actions: const [
        XCartCountWidget(),
      ],
    );
  }
}
