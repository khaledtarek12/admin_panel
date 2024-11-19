import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store_web_adimn/routes/routes.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    log('/*----------------------- middleware called -----------------------*/');
    const isAuthenticated = true;
    return isAuthenticated
        ? null
        : const RouteSettings(name: TRoutes.firstScreen);
  }
}
