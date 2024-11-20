import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_web_adimn/features/authentication/screens/login/resposivne_screen/login_desktop_tablet.dart';
import 'package:t_store_web_adimn/features/authentication/screens/login/resposivne_screen/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: LoginDesktopTablet(),
      mobile: LoginMobile(),
      tablet: LoginDesktopTablet(),
    );
  }
}
