import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:get/get.dart';
import 'package:flutter_dropzone_platform_interface/flutter_dropzone_platform_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:t_store_web_adimn/data/repositories/media/media_repositry.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/popups/dialogs.dart';
import 'package:t_store_web_adimn/utils/popups/full_screen_loader.dart';
import 'package:t_store_web_adimn/utils/popups/loaders.dart';

import 'package:universal_html/html.dart' as html;
import 'package:t_store_web_adimn/features/media/models/image_model.module.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';

class MediaController extends GetxController {
  static MediaController get instance => Get.find();

  late DropzoneViewController dropzoneController;
  final RxBool showImageUploadingSection = false.obs;
  final Rx<MediaCategory> selectedPath = MediaCategory.folders.obs;
  final RxList<ImageModel> selectedImageToUpload = <ImageModel>[].obs;

  final RxList<ImageModel> allImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBanerImages = <ImageModel>[].obs;
  final RxList<ImageModel> allProdustImages = <ImageModel>[].obs;
  final RxList<ImageModel> allBrandImages = <ImageModel>[].obs;
  final RxList<ImageModel> allCategoryImages = <ImageModel>[].obs;
  final RxList<ImageModel> allUserImages = <ImageModel>[].obs;

  final mediaRepositry = Get.put(MediaRepositry());

  Future<dynamic> convertDropzoneFileToFile(DropzoneFileInterface file) async {
    final Uint8List fileData = await dropzoneController.getFileData(file);

    if (kIsWeb) {
      // Web: Return an HTML File
      final blob = html.Blob([fileData]);
      return html.File([blob], file.name);
    } else {
      // Mobile/Desktop: Create a Dart File
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/${file.name}');
      await tempFile.writeAsBytes(fileData);
      return tempFile;
    }
  }

  Future<void> selectedLocalImages() async {
    final files = await dropzoneController
        .pickFiles(multiple: true, mime: ['image/jpeg', 'image/png']);

    if (files.isNotEmpty) {
      for (var file in files) {
        final bytes = await dropzoneController.getFileData(file);
        final convertedFile = await convertDropzoneFileToFile(file);

        // For Mobile/Desktop: Use dart:io.File
        final image = ImageModel(
          url: '',
          file: convertedFile,
          folder: '',
          fileName: file.name,
          localImageToDisplay: Uint8List.fromList(bytes),
        );
        selectedImageToUpload.add(image);
      }
    }
  }

  void uploadImagesConfirmation() {
    if (selectedPath.value == MediaCategory.folders) {
      TLoaders.warningSnakBar(
          title: 'Select Folder',
          message: 'Please select the Folder in Order to upload the Images.');
      return;
    }
    TDialogs.defaultDialog(
        context: Get.context!,
        title: 'Uploads Images',
        confirmText: 'Upload',
        onConfirm: () async => await uploadImage(),
        content:
            'Are you sure you want to upload all the Images in ${selectedPath.value.name.toUpperCase()} folder?');
  }

  Future<void> uploadImage() async {
    try {
      // Remove confirmation box
      Get.back();
      uploadImageLoader();

      // Get the selected cateaory
      MediaCategory selectedCategory = selectedPath.value;
      // Get the corresponding list to update
      RxList<ImageModel> targetList;

      // Check the selected cateaorv and uoaate the corresoondina list
      switch (selectedCategory) {
        case MediaCategory.banners:
          targetList = allBanerImages;
          break;
        case MediaCategory.brands:
          targetList = allBrandImages;
          break;
        case MediaCategory.categories:
          targetList = allCategoryImages;
          break;
        case MediaCategory.products:
          targetList = allProdustImages;
          break;
        case MediaCategory.users:
          targetList = allUserImages;
          break;
        default:
          return;
      }

      // Upload and add images to the target list
      // Using a reverse loop to avoid 'Concurrent modification during iteration' error
      for (var i = selectedImageToUpload.length - 1; i >= 0; i--) {
        var selectedImages = selectedImageToUpload[i];
        final image = selectedImages.file!;
        // Upload Image to the Storag
        final ImageModel uploadImage =
            await mediaRepositry.uploadImageFileStorage(
          file: image,
          path: getSelectedPath(),
          imagename: selectedImages.fileName,
        );

        uploadImage.mediaCategory = selectedCategory.name;
        final id = await mediaRepositry.uploadImageFileInDatabase(uploadImage);
        uploadImage.id = id;

        selectedImageToUpload.removeAt(i);
        targetList.add(uploadImage);
      }
      TFullScreenLoader.stopLoading();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnakBar(
          title: 'Error Uploading Images',
          message: 'Something went wrong while uploading your images. \n $e');
    }
  }

  void uploadImageLoader() {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: const Text('Uploading Images'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(TImages.uploadimage, height: 300, width: 300),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Text('Sit Tight, Your Images are Uploading')
            ],
          ),
        ),
      ),
    );
  }

  String getSelectedPath() {
    String path = '';
    switch (selectedPath.value) {
      case MediaCategory.banners:
        path = TTexts.bannerPath;
        break;
      case MediaCategory.brands:
        path = TTexts.brandPath;
        break;
      case MediaCategory.categories:
        path = TTexts.categoryPath;
        break;
      case MediaCategory.products:
        path = TTexts.productPath;
        break;
      case MediaCategory.users:
        path = TTexts.userPath;
        break;
      default:
        path = 'Others';
    }
    return path;
  }
}
