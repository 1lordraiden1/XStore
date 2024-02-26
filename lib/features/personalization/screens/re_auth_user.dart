import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/features/personalization/controllers/user_controller.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/constants/text_strings.dart';
import 'package:xstore/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Authenticate User")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) =>
                      XValidator.validateEmptyText("Email", value),
                  expands: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: XTexts.email,
                  ),
                ),
                const SizedBox(
                  height: XSizes.spaceBtwInputFields,
                ),
                Obx(
                  () => TextFormField(
                    controller: controller.verifyPass,
                    validator: (value) =>
                        XValidator.validateEmptyText("Password", value),
                    expands: false,
                    obscureText: controller.hidePassword.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye,
                        ),
                        onPressed: () => controller.hidePassword.value =
                            !controller.hidePassword.value,
                      ),
                      labelText: XTexts.password,
                    ),
                  ),
                ),

                const SizedBox(
                  height: XSizes.spaceBtwSections,
                ),

                // Button

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.reAuthEmailandPassUser(),
                    child: const Text("Confirm"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
