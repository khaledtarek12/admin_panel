import 'package:get_storage/get_storage.dart';
import 'package:t_store_web_adimn/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store_web_adimn/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:t_store_web_adimn/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  // Ensure Widgets
  WidgetsFlutterBinding.ensureInitialized();

  //...Get Storage
  await GetStorage.init();
  //...Await Sptlash until otner items Load

  // remove # from the url
  setPathUrlStrategy();

  //...FireBase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) => Get.put(AuthenticationRepository()),
  );

  runApp(const WebAdminPanel());
}
