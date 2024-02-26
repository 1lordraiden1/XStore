import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:xstore/common/widgets/appbar/appbar.dart';
import 'package:xstore/features/personalization/controllers/update_name_controller.dart';
import 'package:xstore/utils/constants/sizes.dart';
import 'package:xstore/utils/constants/text_strings.dart';
import 'package:xstore/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: XAppBar(
        showBackArrow: true,
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: XSizes.spaceBtwSections),
              Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) => XValidator.validateEmptyText(
                        "First Name",
                        value,
                      ),
                      expands: false,
                      decoration: const InputDecoration(
                        prefix: Icon(Iconsax.direct_right),
                        labelText: XTexts.firstName,
                      ),
                    ),
                    const SizedBox(
                      height: XSizes.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) => XValidator.validateEmptyText(
                        "Last Name",
                        value,
                      ),
                      expands: false,
                      decoration: const InputDecoration(
                        prefix: Icon(Iconsax.direct_right),
                        labelText: XTexts.lastName,
                      ),
                    ),

                    const SizedBox(
                      height: XSizes.spaceBtwSections,
                    ),

                    // Button

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.updateUserName(),
                        child: const Text("Save"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
