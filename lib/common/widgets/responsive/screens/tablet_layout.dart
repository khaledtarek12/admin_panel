import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(),
      body: body ??
          TRoundedContainer(
            width: double.infinity,
            height: 500,
            backgroundCoIor: Colors.blue.withOpacity(0.4),
          ),
    );
  }
}
