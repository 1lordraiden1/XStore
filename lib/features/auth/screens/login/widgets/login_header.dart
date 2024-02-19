import 'package:flutter/material.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/constants/text_strings.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = XHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        // logo

        Image(
          height: 150,
          image: AssetImage(
            dark ? XImages.darkAppLogo : XImages.lightAppLogo,
          ),
        ),
        const SizedBox(
          height: XSizes.sm,
        ),
        Text(
          XTexts.homeAppbarTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: XSizes.sm,
        ),
        Text(
          XTexts.homeAppbarSubTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
