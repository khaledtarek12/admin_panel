import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/icons/circular_icons.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';


class TProdcutQuantityWithAddandRemove extends StatelessWidget {
  const TProdcutQuantityWithAddandRemove({
    super.key,
    required this.quantity,
    required this.add,
    required this.remove,
  });

  final int quantity;
  final VoidCallback add, remove;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TcircularIcon(
          onPressed: remove,
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: THelperFunction.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor: THelperFunction.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: TSizes.spaceBtwItems),
        TcircularIcon(
          onPressed: add,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: TSizes.md,
          color: TColors.white,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
