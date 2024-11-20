import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/header/header.dart';

class MobileLayout extends StatelessWidget {
   MobileLayout({super.key, this.body});

  final Widget? body;
      final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar:  THeader(scaffoldKey: scaffoldKey),
      body: body ??
          TRoundedContainer(
            width: double.infinity,
            height: 500,
            backgroundCoIor: Colors.blue.withOpacity(0.4),
          ),
    );
  }
}
