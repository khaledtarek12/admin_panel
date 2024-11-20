import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/images/t_circular_images.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TSidebar extends StatelessWidget {
  const TSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const BeveledRectangleBorder(),
      child: Container(
        decoration: BoxDecoration(
          color: THelperFunction.isDarkMode(context)
              ? TColors.black
              : TColors.white,
          border: const Border(
            right: BorderSide(color: TColors.darkerGrey, width: 1),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image
              TCircularImage(
                width: 100,
                height: 100,
                image: THelperFunction.isDarkMode(context)
                    ? TImages.lightAppLogo
                    : TImages.darkAppLogo,
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(height: TSizes.spaceBtwScetions),
              Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'MENU',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .apply(letterSpacingDelta: 1.2),
                    ),
                    const SizedBox(height: TSizes.xs),

                    // Menu Items
                    // const TMenuItem(
                    //   itemName: 'Dashboard',
                    //   icon: Iconsax.status,
                    //   route: TRoutes.firstScreen,
                    // ),

                    // const TMenuItem(
                    //   itemName: 'Media',
                    //   icon: Iconsax.image,
                    //   route: TRoutes.secondScreen,
                    // ),

                    // const TMenuItem(
                    //   itemName: 'Banners',
                    //   icon: Iconsax.picture_frame,
                    //   route: TRoutes.resposiveDesignScreen,
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
