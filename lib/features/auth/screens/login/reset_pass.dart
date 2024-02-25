import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xstore/features/auth/controllers/forget_pass/forget_pass_conroller.dart';
import 'package:xstore/features/auth/screens/login/login.dart';
import 'package:xstore/utils/constants/sizes.dart';

class ResetPassScreen extends StatelessWidget {
  const ResetPassScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.email,
      
       
      });

  final String image, title, email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // to delete the arrow back
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
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
              Image(image: AssetImage(image)),
              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              // String

              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              Text(
                email,
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
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text("Confirm"),
                ),
              ),
                TextButton(
                onPressed: () => ForgetPassController.instance.resendPasswordResetEmail(email),
                child: const Text("Resend Email !"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
