import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/features/auth/controllers/signup/signup_controller.dart';
import 'package:xstore/utils/constants/colors.dart';
import 'package:xstore/utils/helpers/helper_functions.dart';

class SignupCheckbox extends StatelessWidget {
  const SignupCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = XHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        Flexible(
          child: Text.rich(
            maxLines: 2,
            TextSpan(
              children: [
                TextSpan(
                    text: ' I Agree to ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                  text: ' Privacy Policy ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? XColors.white : XColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? XColors.white : XColors.primary,
                      ),
                ),
                TextSpan(
                  text: ' and ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: ' Terms of use ',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? XColors.white : XColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? XColors.white : XColors.primary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
