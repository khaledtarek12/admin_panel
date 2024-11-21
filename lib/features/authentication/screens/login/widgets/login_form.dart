import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/features/authentication/controllers/login_controller.dart';
import 'package:t_store_web_adimn/routes/routes.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwScetions),
        child: Column(
          children: [
            //   Email
            TextFormField(
              focusNode: controller.emailNode,
              controller: controller.email,
              textInputAction: TextInputAction.next,
              validator: (value) => TValidator.emailValidator(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
              onFieldSubmitted: (value) =>
                  FocusScope.of(context).requestFocus(controller.passwordNode),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            //   Password
            Obx(
              () {
                return TextFormField(
                  focusNode: controller.passwordNode,
                  controller: controller.password,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.hidePassword.value,
                  validator: (value) =>
                      TValidator.validateEmptyText('Password', value),
                  onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye,
                      ),
                      onPressed: () {
                        controller.hidePassword.value =
                            !controller.hidePassword.value;
                      },
                    ),
                  ),
                );
              },
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
                    Obx(
                      () {
                        return Checkbox(
                            value: controller.rememberMe.value,
                            onChanged: (value) {
                              controller.rememberMe.value = value!;
                            });
                      },
                    ),
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
                child: const Text(TTexts.signIn),
                onPressed: () => controller.registerAdmin(),
                // onPressed: () => controller.emailAndPasswordSignin(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
