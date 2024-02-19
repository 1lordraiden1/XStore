import 'package:flutter/material.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/theme/custom/form_divider.dart';
import 'package:xstore/utils/theme/custom/social_buttons.dart';
import 'widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // header
              Text(
                "Create Account...",
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),
              // First Last Names

              // Form

              const SignupForm(),

             
              // check box

              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              //divider

              const XFormDivider(),

              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              //google and facebook

              const XSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
