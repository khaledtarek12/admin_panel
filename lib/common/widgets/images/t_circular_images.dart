import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/loading/skeltionizer.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.image,
    this.backgroundColor,
    this.overLayColor,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.file,
    this.imageType = ImageType.asset,
    this.memoryImage,
  });

  final BoxFit? fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overLayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, height;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunction.isDarkMode(context) ? Colors.black : Colors.white),
        borderRadius: BorderRadius.circular(width >= height ? width : height),
      ),
      child: _buildImageWidget(),
    );
  }

  Widget _buildImageWidget() {
    Widget imageWidget;
    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(width >= height ? width : height),
      child: imageWidget,
    );
  }

  Widget _buildNetworkImage() {
    if (image != null) {
      // Use CachedNetworkImaae for efficient load inq and caching of network imaqes // Not work inq in Web but just for loading
      return CachedNetworkImage(
        imageUrl: image!,
        fit: fit,
        color: overLayColor,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        progressIndicatorBuilder: (context, url, progress) =>
            TShammerEffect(width: width, height: height),
      );
    } else {
      return Container();
    }
  }

  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      // Display imaqe from assets using Imaqe widqet
      return Image.memory(memoryImage!, fit: fit, color: overLayColor);
    } else {
      return Container();
    }
  }

  Widget _buildFileImage() {
    if (file != null) {
      // Display imaqe from assets using Imaqe widqet
      return Image.file(File(image!), fit: fit, color: overLayColor);
    } else {
      return Container();
    }
  }

  Widget _buildAssetImage() {
    if (image != null) {
      // Display imaqe from assets using Imaqe widqet
      return Image.asset(image!, fit: fit, color: overLayColor);
    } else {
      return Container();
    }
  }
}
// ClipOval(
//         child: CachedNetworkImage(
//                 imageUrl: image,
//                 fit: fit,
//                 color: overLayColor,
//                 errorWidget: (context, url, error) => const Icon(Icons.error),
//                 progressIndicatorBuilder: (context, url, progress) =>
//                     const TShammerEffect(width: 55, height: 55, radius: 55),
//               )
//             : Image.asset(
//                 image,
//                 fit: fit,
//                 color: overLayColor,
//               ),
//       ),