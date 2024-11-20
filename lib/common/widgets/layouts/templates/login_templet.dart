import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/styles/spacing_styles.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TLoginTemplet extends StatelessWidget {
  const TLoginTemplet({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);

    return Center(
      child: SizedBox(
        width: 550,
        child: SingleChildScrollView(
          child: Container(
            padding: TSpacingStyles.paddingWithAppbarHeiht,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              color: dark ? TColors.black : TColors.white,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
