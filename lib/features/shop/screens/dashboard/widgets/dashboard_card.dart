import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/texts/seaction_heading.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TDashboardCard extends StatelessWidget {
  const TDashboardCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.stats,
    this.icon = Iconsax.arrow_up_3,
    this.color = TColors.success,
    this.onTap,
  });

  final String title, subTitle;
  final IconData icon;
  final Color color;
  final int stats;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      onTap: onTap,
      padding: const EdgeInsets.all(TSizes.lg),
      child: Column(
        children: [
          // -- Heading
          TSectionHeading(
            title: title,
            textColor: THelperFunction.isDarkMode(context)
                ? TColors.lightGrey
                : TColors.textSecondey,
          ),
          const SizedBox(height: TSizes.spaceBtwScetions),
          // -- Body
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(subTitle, style: Theme.of(context).textTheme.headlineMedium),
              // -- Right Side State
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Icon(
                          icon,
                          color: color,
                          size: TSizes.iconsSm,
                        ),
                        Text(
                          '$stats%',
                          style: Theme.of(context).textTheme.titleLarge!.apply(
                                color: color,
                                overflow: TextOverflow.ellipsis,
                              ),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: SizedBox(
                      width: 135,
                      child: Text(
                        'Compared to Dec 2025',
                        style: Theme.of(context).textTheme.labelMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
