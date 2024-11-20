import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:t_store_web_adimn/routes/routes.dart';

class TRouteObserver extends GetObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    final sidbarController = Get.put(SidebarController());

    if (previousRoute != null) {
      // Check the route name and update the active item in the sidebar accordingly
      for (var routeName in TRoutes.sidebarMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidbarController.activeItem.value = routeName;
        }
      }
    }
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    //     final sidbarController = Get.put(SidebarController());
    // if (route != null) {
    //   // Check the route name and update the active item in the sidebar accordingly
    //   for (var routeName in TRoutes.sideMenuItems) {
    //     if (route.settings.name == routeName) {
    //       sidbarController.activeItem.value = routeName;
    //     }
    //   }
    // }
  }
}
