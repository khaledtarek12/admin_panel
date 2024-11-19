import 'package:flutter/material.dart';

import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/device/device_utility.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TTabar extends StatelessWidget implements PreferredSizeWidget {
  const TTabar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
          splashFactory: NoSplash.splashFactory,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: TColors.primary,
          unselectedLabelColor: TColors.darkGrey,
          labelColor: dark ? TColors.white : TColors.primary,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtility.getAppBarHeight());
}
