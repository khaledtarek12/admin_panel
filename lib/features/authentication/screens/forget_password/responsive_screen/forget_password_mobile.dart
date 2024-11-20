import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/features/authentication/screens/forget_password/widgets/forget_header_and_form.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class ForgetPasswordMobile extends StatelessWidget {
  const ForgetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defultSpace),
          child: HeaderAndForm(),
        ),
      ),
    );
  }
}
