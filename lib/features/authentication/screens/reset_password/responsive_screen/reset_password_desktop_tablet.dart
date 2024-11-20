import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/login_templet.dart';
import 'package:t_store_web_adimn/features/authentication/screens/reset_password/widgets/reset_password_widget.dart';

class ResetPasswordDesktopTablet extends StatelessWidget {
  const ResetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplet(
      child: ResetPasswordWidget(),
    );
  }
}
