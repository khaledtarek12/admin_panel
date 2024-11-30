import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/images/t_rounded_images.dart';
import 'package:t_store_web_adimn/common/widgets/loading/animation_loader.dart';
import 'package:t_store_web_adimn/common/widgets/loading/loader_ainimation_loading.dart';
import 'package:t_store_web_adimn/features/media/controller/media_controller.dart';
import 'package:t_store_web_adimn/features/media/models/image_model.module.dart';
import 'package:t_store_web_adimn/features/media/screens/widgets/folder_dropdown.dart';
import 'package:t_store_web_adimn/features/media/screens/widgets/view_image_details.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = MediaController.instance;
    return TRoundedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Media Images Header
          Row(
            children: [
              Text('Select Folder',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(width: TSizes.spaceBtwItems),
              MediaFolderDropdown(
                onChange: (newValue) {
                  if (newValue != null) {
                    controller.selectedPath.value = newValue;
                    controller.getMediaImages();
                  }
                },
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwScetions),

          Obx(
            () {
              // Get Selected Folder Images
              List<ImageModel> images = _getselectedFolderImages(controller);

              // loader
              if (controller.loading.value && images.isNotEmpty) {
                return const TLoaderAnimation();
              }

              if (images.isEmpty) return _buildEmptyAnimationWidget(context);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Show Media
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: TSizes.spaceBtwItems / 2,
                    runSpacing: TSizes.spaceBtwItems / 2,
                    children: images
                        .map((image) => GestureDetector(
                              onTap: () => Get.dialog(
                                ImagePoupup(image: image),
                              ),
                              child: SizedBox(
                                width: 140,
                                height: 180,
                                child: Column(
                                  children: <Widget>[
                                    _buildSimpleList(image),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: TSizes.sm),
                                      child: Text(image.fileName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                    ))
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),

                  // load More
                  if (!controller.loading.value)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: TSizes.spaceBtwScetions),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: TSizes.buttonWidth,
                            child: ElevatedButton.icon(
                              onPressed: () => controller.loadMoreMediaImages(),
                              label: const Text('Load More'),
                              icon: const Icon(Iconsax.arrow_down),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  List<ImageModel> _getselectedFolderImages(MediaController controller) {
    List<ImageModel> images = [];
    if (controller.selectedPath.value == MediaCategory.banners) {
      images = controller.allBanerImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.brands) {
      images = controller.allBrandImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.categories) {
      images = controller.allCategoryImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.products) {
      images = controller.allProdustImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    } else if (controller.selectedPath.value == MediaCategory.users) {
      images = controller.allUserImages
          .where((image) => image.url.isNotEmpty)
          .toList();
    }
    return images;
  }

  Widget _buildEmptyAnimationWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.lg * 3),
      child: TAnimationLoaderWidgets(
        width: 300,
        height: 300,
        text: 'Select your Desired Folder',
        animation: TImages.packageAnimation,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Widget _buildSimpleList(ImageModel image) {
    return TRoundedlmage(
      width: 140,
      height: 140,
      padding: 0,
      image: image.url,
      fit: BoxFit.cover,
      imageType: ImageType.network,
      margin: TSizes.spaceBtwItems / 2,
      backgroundColor: TColors.primaryBackground,
    );
  }
}
