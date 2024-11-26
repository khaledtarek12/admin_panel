// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/images/t_rounded_images.dart';
import 'package:t_store_web_adimn/features/media/controller/media_controller.dart';
import 'package:t_store_web_adimn/features/media/screens/widgets/folder_dropdown.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/device/device_utility.dart';

class MediaUploader extends StatelessWidget {
  const MediaUploader({super.key});

  @override
  Widget build(BuildContext context) {
    final zoneController = MediaController.instance;
    return Obx(
      () {
        return zoneController.showImageUploadingSection.value
            ? Column(
                children: [
                  /// Drag and Orop Area
                  TRoundedContainer(
                    height: 250,
                    showBorder: true,
                    borderCoIor: TColors.borderPrimary,
                    backgroundCoIor: TColors.primaryBackground,
                    padding: const EdgeInsets.all(TSizes.defultSpace),
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              DropzoneView(
                                mime: const ['image/jpeg', 'image/png'],
                                cursor: CursorType.Default,
                                operation: DragOperation.copy,
                                onLoaded: () => print('Zone Loaded'),
                                onError: (value) => print('Zone Error: $value'),
                                onHover: () => print('Zone Hoverd'),
                                onLeave: () => print('Zone Leaved'),
                                onCreated: (controller) => zoneController
                                    .dropzoneController = controller,
                                onDropFile: (file) => print(file.name),
                                onDropInvalid: (value) =>
                                    print('Zone Invalid MIME : $value'),
                                onDropFiles: (value) =>
                                    print('Zone drop Multiple : $value'),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(TImages.defaultMultiImageIcon,
                                      width: 50, height: 50),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  const Text('Drag and Drop Images here'),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  OutlinedButton(
                                    onPressed: () {},
                                    child: const Text('Select Images'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Locatty Selected Images
                  TRoundedContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Folders Drop down
                            Row(
                              children: [
                                Text('Select Folder',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                MediaFolderDropdown(
                                  onChange: (newValue) {
                                    if (newValue != null) {
                                      zoneController.selectedPath.value =
                                          newValue;
                                    }
                                  },
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('Remove All')),
                                const SizedBox(width: TSizes.spaceBtwItems),
                                TDeviceUtility.isMobileScreen(context)
                                    ? const SizedBox.shrink()
                                    : SizedBox(
                                        width: TSizes.buttonWidth,
                                        child: ElevatedButton(
                                            onPressed: () {},
                                            child: const Text('Upload')),
                                      )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwScetions),
                        const Wrap(
                          alignment: WrapAlignment.start,
                          spacing: TSizes.spaceBtwItems / 2,
                          runSpacing: TSizes.spaceBtwItems / 2,
                          children: [
                            TRoundedlmage(
                              width: 90,
                              height: 90,
                              padding: TSizes.sm,
                              imageType: ImageType.asset,
                              image: TImages.adidasLogo,
                              backgroundColor: TColors.primaryBackground,
                            ),
                            TRoundedlmage(
                              width: 90,
                              height: 90,
                              padding: TSizes.sm,
                              imageType: ImageType.asset,
                              image: TImages.adidasLogo,
                              backgroundColor: TColors.primaryBackground,
                            ),
                            TRoundedlmage(
                              width: 90,
                              height: 90,
                              padding: TSizes.sm,
                              imageType: ImageType.asset,
                              image: TImages.adidasLogo,
                              backgroundColor: TColors.primaryBackground,
                            ),
                            TRoundedlmage(
                              width: 90,
                              height: 90,
                              padding: TSizes.sm,
                              imageType: ImageType.asset,
                              image: TImages.adidasLogo,
                              backgroundColor: TColors.primaryBackground,
                            ),
                            TRoundedlmage(
                              width: 90,
                              height: 90,
                              padding: TSizes.sm,
                              imageType: ImageType.asset,
                              image: TImages.adidasLogo,
                              backgroundColor: TColors.primaryBackground,
                            ),
                            TRoundedlmage(
                              width: 90,
                              height: 90,
                              padding: TSizes.sm,
                              imageType: ImageType.asset,
                              image: TImages.adidasLogo,
                              backgroundColor: TColors.primaryBackground,
                            ),
                            TRoundedlmage(
                              width: 90,
                              height: 90,
                              padding: TSizes.sm,
                              imageType: ImageType.asset,
                              image: TImages.adidasLogo,
                              backgroundColor: TColors.primaryBackground,
                            ),
                          ],
                        ),
                        const SizedBox(height: TSizes.spaceBtwScetions),
                        TDeviceUtility.isMobileScreen(context)
                            ? SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Upload')),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwScetions),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }
}
