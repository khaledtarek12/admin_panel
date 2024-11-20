import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/routes/app_routes.dart';
import 'package:t_store_web_adimn/routes/routes.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/theme/theme.dart';

class WebAdminPanel extends StatelessWidget {
  const WebAdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: TAppRoutes.pages,
      initialRoute: TRoutes.login,
      unknownRoute: GetPage(
        name: '/page-not-found',
        page: () => Scaffold(
          body: Center(
            child: Text('Page Not Found',
                style: Theme.of(context).textTheme.titleLarge),
          ),
        ),
      ),
    );
  }
}
