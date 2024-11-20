import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/header/header.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(child: Drawer()),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                // header
                const THeader(),

                // Body
                body ?? const SizedBox(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
