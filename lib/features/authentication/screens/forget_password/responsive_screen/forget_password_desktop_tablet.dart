import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/login_templet.dart';
import 'package:t_store_web_adimn/features/authentication/screens/forget_password/widgets/forget_header_and_form.dart';

class ForgetPasswordDesktopTablet extends StatelessWidget {
  const ForgetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplet(
      child: HeaderAndForm(),
    );
  }
}
