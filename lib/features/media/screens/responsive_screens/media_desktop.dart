import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
import 'package:t_store_web_adimn/features/media/controller/media_controller.dart';
import 'package:t_store_web_adimn/features/media/screens/widgets/media_content.dart';
import 'package:t_store_web_adimn/features/media/screens/widgets/media_uploader.dart';
import 'package:t_store_web_adimn/routes/routes.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class MediaDesktopScreen extends StatelessWidget {
  const MediaDesktopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MediaController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //--Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // BreadCrumbs
                  const TBreadcrumbWithHeading(
                    heading: 'Media',
                    breadcrumbItems: [TRoutes.login, 'Media Screen'],
                  ),
                  SizedBox(
                    width: TSizes.buttonWidth * 1.5,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        controller.showImageUploadingSection.value =
                            !controller.showImageUploadingSection.value;
                      },
                      icon: const Icon(Iconsax.cloud_add),
                      label: const Text('Upload Images'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwScetions),
              //--Upload Area
              const MediaUploader(),

              //--Media
              const MediaContent(),
            ],
          ),
        ),
      ),
    );
  }
}
