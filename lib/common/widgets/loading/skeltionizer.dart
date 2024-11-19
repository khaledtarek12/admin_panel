import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';


class TShammerEffect extends StatelessWidget {
  const TShammerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 12,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Shimmer.fromColors(
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: dark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? TColors.darkerGrey : TColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
