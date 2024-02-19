import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/features/auth/controllers/signup/signup_controller.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/constants/text_strings.dart';
import 'package:xstore/utils/validators/validation.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      XValidator.validateEmptyText("First name", value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: XTexts.firstName,
                  ),
                ),
              ),
              const SizedBox(
                width: XSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      XValidator.validateEmptyText("Last name", value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: XTexts.lastName,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(
            height: XSizes.spaceBtwInputFields,
          ),

          // Rest of Form

          TextFormField(
            controller: controller.username,
            validator: (value) =>
                XValidator.validateEmptyText("User name", value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: XTexts.username,
            ),
          ),

          const SizedBox(
            height: XSizes.spaceBtwInputFields,
          ),

          TextFormField(
            controller: controller.email,
            validator: (value) => XValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: XTexts.email,
            ),
          ),

          const SizedBox(
            height: XSizes.spaceBtwInputFields,
          ),

          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => XValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: XTexts.phoneNumber,
            ),
          ),

          const SizedBox(
            height: XSizes.spaceBtwInputFields,
          ),

          TextFormField(
            controller: controller.password,
            validator: (value) => XValidator.validatePassword(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
              labelText: XTexts.password,
            ),
          ),
        ],
      ),
    );
  }
}
