import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/app.dart';

void main() async {
    //...FireBase
  WidgetsFlutterBinding.ensureInitialized();

    //...Get Storage

      //...Await Sptlash until otner items Load
  runApp(const AdminWebPanel());
}
