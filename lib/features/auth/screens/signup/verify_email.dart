import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/common/widgets/success.dart';
import 'package:xstore/data/repositories/auth_repo.dart';
import 'package:xstore/features/auth/controllers/signup/verify_email_controller.dart';
import 'package:xstore/features/auth/screens/login/login.dart';
import 'package:xstore/utils/constants/image_strings.dart';
import 'package:xstore/utils/constants/sizes.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({
    super.key,
    this.email,
  });

  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        // to delete the arrow back
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              const Image(image: AssetImage(XImages.onBoardingImage3)),
              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              // String

              Text(
                "Verfiy your Email",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                "Check your Email",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              // Button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text("Continue"),
                ),
              ),

              TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: const Text("Resend Email !"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
