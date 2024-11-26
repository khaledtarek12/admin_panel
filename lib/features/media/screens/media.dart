import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/templates/site_layout.dart';
import 'package:t_store_web_adimn/features/media/screens/responsive_screens/media_desktop.dart';
// import 'package:t_store_web_adimn/features/media/screens/responsive_screens/media_mobile.dart';
// import 'package:t_store_web_adimn/features/media/screens/responsive_screens/media_tablet.dart';

class MediaScreen extends StatelessWidget {
  const MediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TSiteTemplate(desktop: MediaDesktopScreen()
        // tablet: MediaTabletScreen(),
        // mobile: MediaMobileScreen(),
        );
  }
}
