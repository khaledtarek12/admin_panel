import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/routes/routes.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwScetions),
        child: Column(
          children: [
            //   Email
            TextFormField(
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
            const SizedBox(height: TSizes.spaceBtwInputFields),

            //   Email
            TextFormField(
              // focusNode: controller.fEmailNode,
              // controller: controller.email,
              textInputAction: TextInputAction.next,
              validator: (value) => TValidator.emailValidator(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Iconsax.eye_slash),
                ),
              ),
              // onFieldSubmitted: (value) =>
              //     FocusScope.of(context).requestFocus(controller.fPasswordNode),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            //Remeber me and forrget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Remeber me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                //Forrget password
                TextButton(
                    onPressed: () => Get.toNamed(TRoutes.forgetPassword),
                    child: const Text(TTexts.forrgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwScetions),

            //Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(TTexts.signIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
