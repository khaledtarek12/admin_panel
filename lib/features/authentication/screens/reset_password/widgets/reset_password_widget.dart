import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/routes/routes.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    final email = Get.parameters['email'] ?? '';
    return Column(
      children: [
        // -- Header
        Row(
          children: [
            IconButton(
              onPressed: () => Get.offAllNamed(TRoutes.login),
              icon: const Icon(CupertinoIcons.clear),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // -- Image
        Image.asset(dark ? TImages.verifyEmail : TImages.checkEmaiLight,
            width: 300, height: 300),
        const SizedBox(height: TSizes.spaceBtwItems),

        // -- Title & SubTitle
        Text(
          TTexts.changeYourPasswordTitle,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(email,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text(
          TTexts.changeYourPasswordSubTitle,
          style: Theme.of(context).textTheme.labelMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: TSizes.spaceBtwScetions),

        // -- Buttons
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.offAllNamed(TRoutes.login),
            child: const Text(TTexts.done),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {},
            child: const Text(TTexts.resendEmail),
          ),
        ),
      ],
    );
  }
}
