import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store_web_adimn/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store_web_adimn/data/repositories/user/user_repositry.dart';
import 'package:t_store_web_adimn/features/authentication/controllers/user_controller.dart';
import 'package:t_store_web_adimn/features/authentication/models/user_model.module.dart';
import 'package:t_store_web_adimn/utils/constants/enums.dart';
import 'package:t_store_web_adimn/utils/constants/image_strings.dart';
import 'package:t_store_web_adimn/utils/constants/text_strings.dart';
import 'package:t_store_web_adimn/utils/helpers/network_manager.dart';
import 'package:t_store_web_adimn/utils/popups/full_screen_loader.dart';
import 'package:t_store_web_adimn/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// variables
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final rememberMe = true.obs;
  final hidePassword = true.obs;

  final emailNode = FocusNode();
  final passwordNode = FocusNode();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // final userController = Get.put(UserController());

  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL') != null &&
        localStorage.read('REMEMBER_ME_PASSWORD') != null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    }
    super.onInit();
  }

  //-- Email ond Password SignIn
  Future<void> emailAndPasswordSignin() async {
    try {
      // Start Loading
      TFullScreenLoader.openDesktopLoadingDialog(
          'Logging you in....', TImages.loading);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnakBar(
            title: 'Connection Error', message: 'No internet connection.');
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email & Password Authentication
      await AuthenticationRepository.instance.loginWithEmaitAndPassword(
          email: email.text.trim(), password: password.text.trim());
      log("Login successful."); // Debug: Login successful

      // Fetch user details and assign to UserControtler
      final user = await UserController.instance.fetchUserDetails();

      // Remove loader and Redirect
      TFullScreenLoader.stopLoading();

      // If user is not admin, logout and return
      if (user.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        TLoaders.errorSnakBar(
            title: 'Not Authorized',
            message:
                'You are not authorized or don\'t have access. Contact Admin.');
      } else {
        // Redirect
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      // Remove loader and show error message
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnakBar(title: 'Oh Snap!', message: e.toString());
      log("Error occurred: $e"); // Debug: Exception caught
    }
  }

  /// Handles registration of admin user
  Future<void> registerAdmin() async {
    // Start Loading
    TFullScreenLoader.openDesktopLoadingDialog(
        'RegisterAdminAccount....', TImages.loading);
    try {
      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      // if (!loginFormKey.currentState!.validate()) {
      //   TFullScreenLoader.stopLoading();
      //   TLoaders.errorSnakBar(
      //       title: 'Invalid Input', message: 'Please fill out all fields.');
      //   return;
      // }

      // Attempt login with Firebase Authentication
      await AuthenticationRepository.instance.registerWithEmaitAndPassword(
        email: TTexts.adminEmail,
        password: TTexts.adminPassword,
      );
      log("Register successful."); // Debug: Login successful

      // Create admin rec ord in the Firestore
      final userRepository = Get.put(UserRepository());
      await userRepository.createUser(
        UserModel(
          id: AuthenticationRepository.instance.authUser!.uid,
          firstName: 'Khaled',
          lastName: 'Tarek',
          email: TTexts.adminEmail,
          role: AppRole.admin,
          createdAt: DateTime.now(),
        ),
      );

      // Remove loader and Redirect
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove loader and show error message
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnakBar(title: 'Oh Snap!', message: e.toString());
      log("Error occurred: $e"); // Debug: Exception caught
    }
  }

  //-- Google Signin Authentication
  // Future<void> googleSignIn() async {
  //   try {
  //     // Debug: Start of function
  //     log("Starting GoogleSignin...");
  //     // Start Loading
  //     TFullScreenLoader.openLoadingDialog(
  //         'Logging you in....', TImages.loading);
  //     log("Loading dialog opened."); // Debug: Loader opened
  //     // Check Internet Connectivity
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     log("Internet connection check completed: $isConnected"); // Debug: Internet connectivity result
  //     if (!isConnected) {
  //       TFullScreenLoader.stopLoading();
  //       TLoaders.errorSnakBar(
  //           title: 'Connection Error', message: 'No internet connection.');
  //       log("No internet connection. Exiting function."); // Debug: No internet
  //       return;
  //     }
  //     //-- Google Authentication
  //     final userCredentials =
  //         await AuthenticationRepository.instance.signInWithGoogle();
  //     // -- Save User Data
  //     await userController.saveUserCard(userCredentials);
  //     // Remove the Loaders
  //     TFullScreenLoader.stopLoading();
  //     // Redirect Screens
  //     AuthenticationRepository.instance.screenRedirect();
  //   } catch (e) {
  //     // Remove the Loaders
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.errorSnakBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }
}
