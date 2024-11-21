import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:t_store_web_adimn/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store_web_adimn/routes/routes.dart';

class TRouteMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AuthenticationRepository.instance.isAuthenticated
        ? null
        : const RouteSettings(name: TRoutes.login);
  }
}
