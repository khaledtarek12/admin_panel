import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/common/widgets/layouts/sidebars/sidebar_controller.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class TMenuItem extends StatelessWidget {
  const TMenuItem({
    super.key,
    required this.route,
    required this.icon,
    required this.itemName,
  });

  final String route;
  final IconData icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());
    return InkWell(
      onTap: () => menuController.menuOnTap(route),
      onHover: (hovring) => hovring
          ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(''),
      child: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: TSizes.sm),
            child: Container(
              decoration: BoxDecoration(
                color: menuController.isActive(route) ||
                        menuController.isHovering(route)
                    ? TColors.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(TSizes.cardRadiusMd),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: TSizes.lg,
                      top: TSizes.md,
                      bottom: TSizes.md,
                      right: TSizes.md,
                    ),
                    child: menuController.isActive(route)
                        ? Icon(icon, size: 22, color: TColors.white)
                        : Icon(
                            icon,
                            size: 22,
                            color: menuController.isHovering(route)
                                ? TColors.white
                                : TColors.darkGrey,
                          ),
                  ),
                  if (menuController.isActive(route) ||
                      menuController.isHovering(route))
                    Flexible(
                      child: Text(
                        itemName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.white),
                      ),
                    )
                  else
                    Flexible(
                      child: Text(
                        itemName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.darkGrey),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
