import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store_web_adimn/common/widgets/loading/skeltionizer.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/sizes.dart';

class TRoundedlmage extends StatelessWidget {
  const TRoundedlmage({
    super.key,
    this.borderRaduis = TSizes.md,
    this.padding = TSizes.sm,
    this.border,
    this.width = 56,
    this.hight = 56,
    this.image,
    this.fit = BoxFit.contain,
    this.applayImageRaduis = true,
    this.backgroundColor,
    this.file,
    required this.imageType,
    this.overLayColor,
    this.memoryImage,
    this.margin,
  });

  final bool applayImageRaduis;
  final BoxBorder? border;
  final double borderRaduis;
  final BoxFit fit;
  final String? image;
  final File? file;
  final ImageType imageType;
  final Color? overLayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double width, hight, padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      padding: EdgeInsets.all(padding),
      margin: EdgeInsets.all(margin ?? 0),
      decoration: BoxDecoration(
        border: border,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRaduis),
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
      borderRadius: applayImageRaduis
          ? BorderRadius.circular(borderRaduis)
          : BorderRadius.zero,
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
            TShammerEffect(width: width, height: hight),
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