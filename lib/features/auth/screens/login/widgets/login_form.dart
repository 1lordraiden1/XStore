import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/features/auth/controllers/login/login_controller.dart';
import 'package:xstore/features/auth/screens/login/forget_pass.dart';
import 'package:xstore/features/auth/screens/signup/signup.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/constants/text_strings.dart';
import 'package:xstore/utils/validators/validation.dart';

class XLoginForm extends StatelessWidget {
  const XLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: XSizes.spaceBtwSections),
        child: Column(
          children: [
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
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    XValidator.validateEmptyText("Password", value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: XTexts.password,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: XSizes.spaceBtwInputFields / 2,
            ),

            // remember me

            Wrap(
              // this is Row
              crossAxisAlignment:
                  WrapCrossAlignment.center, // adjusted from main axis .start
              children: [
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value,
                      ),
                    ),
                    const Text(XTexts.rememberMe),
                  ],
                ),

                // forget password

                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassScreen()),
                  child: const Text(
                    XTexts.forgetPassword,
                  ),
                )
              ],
            ),

            const SizedBox(
              height: XSizes.spaceBtwSections,
            ),

            //sign in

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text("Sign in"),
              ),
            ),

            const SizedBox(
              height: XSizes.spaceBtwItems,
            ),

            //create account

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: const Text("Create Account"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
