import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TAnimationLoaderWidgets extends StatelessWidget {
  const TAnimationLoaderWidgets({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Center the content vertically
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.5, // Adjust size
            height: MediaQuery.of(context).size.height * 0.5,
            
            fit: BoxFit.contain, // Maintain aspect ratio
          ),
          const SizedBox(height: TSizes.spaceBtwItems * 2),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defultSpace),
          if (showAction)
            SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.transparent),
                  backgroundColor: THelperFunction.isDarkMode(context)
                      ? Colors.black
                      : TColors.dark,
                ),
                child: Text(
                  actionText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: TColors.light),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
