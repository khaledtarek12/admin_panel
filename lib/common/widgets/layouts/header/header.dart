import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/images/t_rounded_images.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/device/device_utility.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class THeader extends StatelessWidget implements PreferredSizeWidget {
  const THeader({super.key, this.scaffoldKey});

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            THelperFunction.isDarkMode(context) ? TColors.black : TColors.white,
        border: const Border(
          bottom: BorderSide(color: TColors.darkerGrey, width: 2),
        ),
      ),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm, horizontal: TSizes.lg),
      child: AppBar(
        /// Mobile Menu
        leading: !TDeviceUtility.isDesktopScreen(context)
            ? IconButton(
                onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                icon: Icon(
                  Iconsax.menu,
                  color: THelperFunction.isDarkMode(context)
                      ? Colors.white
                      : TColors.darkerGrey,
                ))
            : null,

        /// Search Field
        title: TDeviceUtility.isDesktopScreen(context)
            ? SizedBox(
                width: 400,
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.search_normal),
                      hintText: 'Search anyThing...'),
                ),
              )
            : null,

        /// Actions
        actions: [
          // Search Icon on Mobile
          if (!TDeviceUtility.isDesktopScreen(context))
            IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.search_normal,
                color: THelperFunction.isDarkMode(context)
                    ? Colors.white
                    : TColors.darkerGrey,
              ),
            ),

          // Notification Icon
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.notification,
              color: THelperFunction.isDarkMode(context)
                  ? Colors.white
                  : TColors.darkerGrey,
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems / 2),

          // User Data
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TRoundedlmage(
                imageType: ImageType.asset,
                image: TImages.user,
                width: 40,
                padding: 2,
                hight: 40,
              ),
              SizedBox(width: TSizes.sm),
            ],
          ),

          // Name and Email
          if (!TDeviceUtility.isMobileScreen(context))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Khaled Tarek',
                    style: Theme.of(context).textTheme.titleLarge),
                Text('tkhaled238@gmai.com',
                    style: Theme.of(context).textTheme.labelLarge)
              ],
            )
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(TDeviceUtility.getAppBarHeight() + 15);
}
