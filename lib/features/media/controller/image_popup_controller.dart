import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter/material.dart';

class ImagePopupController extends GetxController {
  final String imageUrl;
  Rx<Color> dominantColor = Colors.transparent.obs;

  ImagePopupController(this.imageUrl);

  @override
  void onInit() {
    super.onInit();
    
    _extractDominantColor();
  }

  Future<void> _extractDominantColor() async {
    try {
      final palette = await PaletteGenerator.fromImageProvider(
        NetworkImage(imageUrl),
        size: const Size(100, 100), // Limit the resolution
      );
      dominantColor.value = palette.dominantColor?.color ?? Colors.grey;
    } catch (e) {
      dominantColor.value = Colors.grey; // Fallback color
    }
  }
}
