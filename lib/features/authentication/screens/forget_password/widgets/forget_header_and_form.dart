
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/routes/routes.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/validators/validation.dart';

class HeaderAndForm extends StatelessWidget {
  const HeaderAndForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -- Header
        IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Iconsax.arrow_left),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.forrgetPasswordTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(TTexts.forrgetPasswordSubTitle,
            style: Theme.of(context).textTheme.labelMedium),
        const SizedBox(height: TSizes.spaceBtwScetions * 2),
    
        // -- Form
        Form(
          child: TextFormField(
            // focusNode: controller.fEmailNode,
            // controller: controller.email,
            textInputAction: TextInputAction.next,
            validator: (value) => TValidator.emailValidator(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email,
            ),
            // onFieldSubmitted: (value) =>
            //     FocusScope.of(context).requestFocus(controller.fPasswordNode),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwScetions),
    
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.toNamed(
              TRoutes.resetPassword,
              parameters: {'email': 'tkhaled238@gmail.com'},
            ),
            child: const Text(TTexts.submet),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwScetions * 2),
      ],
    );
  }
}
