import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_web_adimn/features/authentication/screens/reset_password/responsive_screen/reset_password_desktop_tablet.dart';
import 'package:t_store_web_adimn/features/authentication/screens/reset_password/responsive_screen/reset_password_mobile.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const TSiteTemplate(
      useLayout: false,
      desktop: ResetPasswordDesktopTablet(),
      tablet: ResetPasswordDesktopTablet(),
      mobile: ResetPasswordMobile(),
    );
  }
}
