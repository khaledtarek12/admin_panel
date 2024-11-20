import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/header/header.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/sidebars/sidebar.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  final Widget? body;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const TSidebar(),
      appBar: THeader(scaffoldKey: scaffoldKey),
      body: body ??
          TRoundedContainer(
            width: double.infinity,
            height: 500,
            backgroundCoIor: Colors.blue.withOpacity(0.4),
          ),
    );
  }
}
