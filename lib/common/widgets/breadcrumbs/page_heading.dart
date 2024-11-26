import 'package:flutter/material.dart';

class TPageHeading extends StatelessWidget {
  const TPageHeading({super.key, this.rightSideWidget, required this.heading});

  final Widget? rightSideWidget;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(heading, style: Theme.of(context).textTheme.headlineLarge),
        rightSideWidget ?? const SizedBox()
      ],
    );
  }
}
