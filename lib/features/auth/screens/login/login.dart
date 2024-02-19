import 'package:flutter/material.dart';
import 'package:xstore/common/styles/spacing_style.dart';
import 'package:xstore/utils/constants/sizes.dart';

import '../../../../utils/theme/custom/form_divider.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import '../../../../utils/theme/custom/social_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: XSpacingStyle.paddingWithAppBarWeight,
          child: Column(
            children: [
               LoginHeader(),

              // Form
               XLoginForm(),

              //divider

              XFormDivider(),

               SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              //google and facebook

               XSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
