import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';

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
                TRoundedContainer(
                  width: double.infinity,
                  height: 75,
                  backgroundCoIor: Colors.yellow.withOpacity(0.4),
                ),

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
