import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.padding = const EdgeInsets.all(TSizes.lg),
    this.margin,
    this.child,
    this.backgroundCoIor = TColors.white,
    this.borderCoIor = TColors.borderPrimary,
    this.showBorder = false,
    this.showShadow = true,
    this.onTap,
  });

  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Widget? child;
  final bool showBorder;
  final Color backgroundCoIor;
  final Color borderCoIor;
  final bool showShadow;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            color: THelperFunction.isDarkMode(context)
                ? TColors.darkerGrey
                : backgroundCoIor,
            borderRadius: BorderRadius.circular(radius),
            border: showBorder ? Border.all(color: borderCoIor) : null,
            boxShadow: [
              if (showShadow)
                BoxShadow(
                    color: THelperFunction.isDarkMode(context)
                        ? TColors.black.withOpacity(0.5)
                        : TColors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 8,
                    offset: const Offset(0, 3)),
            ]),
        child: child,
      ),
    );
  }
}
