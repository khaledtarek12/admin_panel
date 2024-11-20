import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_web_adimn/features/authentication/screens/forget_password/responsive_screen/forget_password_desktop_tablet.dart';
import 'package:t_store_web_adimn/features/authentication/screens/forget_password/responsive_screen/forget_password_mobile.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      useLayout: false,
      desktop: ForgetPasswordDesktopTablet(),
      tablet: ForgetPasswordDesktopTablet(),
      mobile: ForgetPasswordMobile(),
    );
  }
}
