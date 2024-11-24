import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/responive_screens/dashboard_desktop.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/responive_screens/dashboard_mobile.dart';
import 'package:t_store_web_adimn/features/shop/screens/dashboard/responive_screens/dashbord_tablet.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(
      desktop: DashboardDesktopScreen(),
      tablet: DashbordTabletScreen(),
      mobile:  DashboardMobileScreen(),
    );
  }
}