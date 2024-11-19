import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/app.dart';
import 'package:t_store_web_adimn/firebase_options.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  // Ensure Widgets
  WidgetsFlutterBinding.ensureInitialized();

  //...Get Storage

  //...Await Sptlash until otner items Load

  // remove # from the url
  setPathUrlStrategy();

  //...FireBase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (value) {
      // return Get.put(AuthenticationRepository());
    },
  );

  runApp(const WebAdminPanel());
}
