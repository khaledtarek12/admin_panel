import 'dart:ui'; // Import for the Blur effect
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/common/widgets/loading/animation_loader.dart';
import 'package:t_store_web_adimn/common/widgets/loading/custom_loading.dart';
import 'package:t_store_web_adimn/utils/constants/colors.dart';
import 'package:t_store_web_adimn/utils/helpers/helper_function.dart';

class TFullScreenLoader {
  static void openDesktopLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: THelperFunction.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          child: TAnimationLoaderWidgets(text: text, animation: animation),
        ),
      ),
    );
  }

  static void popUPCircular() {
    Get.defaultDialog(
      title: '',
      onWillPop: () async => false,
      content: const CustomLoading(),
      backgroundColor: Colors.transparent,
    );
  }

  static void openMobileLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Rounded corners
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              width: 300, // Set the width of the dialog
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white10]),
                borderRadius: BorderRadius.circular(12.0), // Rounded corners
                border: Border.all(
                    color: Colors.white30,
                    width: 1), // Light border for the glass effect
              ),

              child: Center(
                child:
                    TAnimationLoaderWidgets(text: text, animation: animation),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
