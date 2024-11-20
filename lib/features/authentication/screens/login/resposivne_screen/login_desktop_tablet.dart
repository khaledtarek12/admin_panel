import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/login_templet.dart';
import 'package:t_store_web_adimn/features/authentication/screens/login/widgets/login_from.dart';
import 'package:t_store_web_adimn/features/authentication/screens/login/widgets/login_header.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const TLoginTemplet(
      child: Column(
        
        children: [
          // -- Header
          TLoginHeader(),

          // -- Body
          TLoginForm(),
        ],
      ),
    );
  }
}
