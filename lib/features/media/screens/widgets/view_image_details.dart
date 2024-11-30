import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store_web_adimn/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:t_store_web_adimn/common/widgets/images/t_rounded_images.dart';
import 'package:t_store_web_adimn/features/media/controller/image_popup_controller.dart';
import 'package:t_store_web_adimn/features/media/models/image_model.module.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/device/device_utility.dart';
import 'package:t_store_web_adimn/utils/popups/loaders.dart';

class ImagePoupup extends StatefulWidget {
  const ImagePoupup({super.key, required this.image});

  final ImageModel image;

  @override
  State<ImagePoupup> createState() => _ImagePoupupState();
}

class _ImagePoupupState extends State<ImagePoupup>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Define the slide animation
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Start off-screen at the top
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    // Start the animation
    _animationController.forward();
  }

  void _closePopup() {
    // Reverse the animation
    _animationController.reverse().then((value) {
      // Close the popup after the animation ends
      Get.back();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ImagePopupController controller =
        Get.put(ImagePopupController(widget.image.url));

    return SingleChildScrollView(
      child: SlideTransition(
        position: _slideAnimation,
        child: Obx(() {
          return Dialog(
              backgroundColor: controller.dominantColor.value,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
              ),
              child: TRoundedContainer(
                backgroundCoIor: Colors.red,
                width: TDeviceUtility.isDesktopScreen(context)
                    ? MediaQuery.of(context).size.width * 0.4
                    : double.infinity,
                padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Obx(() {
                          return TRoundedlmage(
                            backgroundColor: controller.dominantColor.value,
                            image: widget.image.url,
                            applayImageRaduis: true,
                            height: MediaQuery.of(context).size.height * 0.4,
                            width: TDeviceUtility.isDesktopScreen(context)
                                ? MediaQuery.of(context).size.width * 0.4
                                : double.infinity,
                            imageType: ImageType.network,
                          );
                        }),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            onPressed: _closePopup,
                            icon: const Icon(Iconsax.close_circle),
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Row(
                      children: [
                        Expanded(
                            child: Text('Image Name',
                                style: Theme.of(context).textTheme.bodyLarge)),
                        Expanded(
                            flex: 3,
                            child: Text(widget.image.fileName,
                                style: Theme.of(context).textTheme.titleLarge))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Text('Image Url',
                                style: Theme.of(context).textTheme.bodyLarge)),
                        Expanded(
                          flex: 2,
                          child: Text(widget.image.url,
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Obx(
                          () {
                            return Expanded(
                                child: OutlinedButton.icon(
                                    icon: const Icon(Iconsax.copy),
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor:
                                          controller.dominantColor.value,
                                      side: BorderSide(
                                        color: controller.dominantColor.value,
                                      ),
                                    ),
                                    onPressed: () {
                                      FlutterClipboard.copy(widget.image.url)
                                          .then((value) => TLoaders.customToast(
                                              message: 'URL copied!'));
                                    },
                                    label: const Text('Copy URL')));
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwScetions),
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 300,
                              child: OutlinedButton.icon(
                                onPressed: () {},
                                icon: const Icon(IconlyBold.delete,
                                    color: Colors.red),
                                label: const Text('Delete Image'),
                                style: OutlinedButton.styleFrom(
                                  backgroundColor:
                                      controller.dominantColor.value,
                                  side: BorderSide(
                                    color: controller.dominantColor.value,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ));
        }),
      ),
    );
  }
}
