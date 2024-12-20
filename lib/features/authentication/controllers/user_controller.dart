import 'package:get/get.dart';
import 'package:t_store_web_adimn/data/repositories/user/user_repositry.dart';
import 'package:t_store_web_adimn/features/authentication/models/user_model.module.dart';
import 'package:t_store_web_adimn/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final loading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  // final imageUploding = false.obs;
  // final hidePassword = true.obs;
  // final verifyEmail = TextEditingController();
  // final verifyPassword = TextEditingController();
  // final verifyEmailNode = FocusNode();
  // final verifyPasswordNode = FocusNode();
  // GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  // Fetch user record
  Future<UserModel> fetchUserDetails() async {
    try {
      loading.value = true;
      final userRecord = await userRepository.fetchAdminDetails();
      user.value = userRecord;
      loading.value = false;
      return userRecord;
    } catch (e) {
      loading.value = false;
      TLoaders.errorSnakBar(
          title: 'Something went wrong.', message: e.toString());
      return UserModel.empty();
    }
  }

  // Save user Record from any Registration provider
  // Future<void> saveUserCard(UserCredential? userCredentials) async {
  //   try {
  //     // First Update Rx User and then check if user data is already stored. If not store new data
  //     await fetchUserRecord();

  //     // If no record already stored.
  //     if (user.value.id!.isEmpty) {
  //       if (userCredentials != null) {
  //         // Convert Name to First and Last Name
  //         final nameParts =
  //             UserModel.nameParts(userCredentials.user!.displayName ?? '');
  //         final userName = UserModel.generateUsername(
  //             userCredentials.user!.displayName ?? '');

  //         // Map the Data
  //         final newUser = UserModel(
  //           id: userCredentials.user!.uid,
  //           firstName: nameParts[0],
  //           lastName:
  //               nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
  //           userName: userName,
  //           email: userCredentials.user!.email ?? '',
  //           phoneNumber: userCredentials.user!.phoneNumber ?? '',
  //           profilePicture: userCredentials.user!.photoURL ?? '',
  //         );

  //         // Save User Data
  //         await userRepository.saveUserCard(newUser);
  //       }
  //     }
  //   } catch (e) {
  //     TLoaders.errorSnakBar(
  //         title: 'Data not Saved',
  //         message:
  //             'something went wrong while saving your information. You can re-save your data in your Profile.');
  //   }
  // }

  // Delete Account Warning
  // void deleteAccountWarringPopup() {
  //   Get.defaultDialog(
  //     contentPadding: const EdgeInsets.all(TSizes.md),
  //     title: 'Delete Accont',
  //     middleText:
  //         'Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
  //     confirm: ElevatedButton(
  //         onPressed: () async => deleteUserAccount(),
  //         style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.red,
  //           side: const BorderSide(color: Colors.red),
  //         ),
  //         child: const Padding(
  //           padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
  //           child: Text('Delete'),
  //         )),
  //     cancel: OutlinedButton(
  //         onPressed: () => Navigator.of(Get.overlayContext!).pop(),
  //         child: const Text('Cancle')),
  //   );
  // }

  // Delete User Account
  // void deleteUserAccount() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog('Processing...', TImages.loading);

  //     // First re-authenticate user
  //     final auth = AuthenticationRepository.instance;
  //     final provider =
  //         auth.authUser!.providerData.map((e) => e.providerId).first;
  //     if (provider.isNotEmpty) {
  //       // Re Verify Auth Email
  //       if (provider == 'google.com') {
  //         await auth.signInWithGoogle();
  //         await auth.deleteAccount();
  //         TFullScreenLoader.stopLoading();
  //         Get.offAll(() => const LoginScreen());
  //       } else if (provider == 'password') {
  //         TFullScreenLoader.stopLoading();
  //         Get.to(() => const ReAuthLoginForm());
  //       }
  //     }
  //   } catch (e) {
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.warningSnakBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }

  // RE-AUTHFUTICATE before deleting
  // Future<void> reAuthenticateEmailAndPasswordUser() async {
  //   try {
  //     TFullScreenLoader.openLoadingDialog('Processing...', TImages.loading);

  //     // Check internet
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     log("Internet connection check completed: $isConnected"); // Debug: Internet connectivity result
  //     if (!isConnected) {
  //       TFullScreenLoader.stopLoading();
  //       TLoaders.errorSnakBar(
  //           title: 'Connection Error', message: 'No internet connection.');
  //       log("No internet connection. Exiting function."); // Debug: No internet
  //       return;
  //     }

  //     if (!reAuthFormKey.currentState!.validate()) {
  //       TFullScreenLoader.stopLoading();
  //       return;
  //     }

  //     await AuthenticationRepository.instance
  //         .reAuthenticateWithEmaitAndPassword(
  //             verifyEmail.text.trim(), verifyPassword.text.trim());
  //     await AuthenticationRepository.instance.deleteAccount();
  //     TFullScreenLoader.stopLoading();

  //     Get.offAll(() => const LoginScreen());
  //   } catch (e) {
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.warningSnakBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }

  // Upload Profile Imoge
  // uploadUserProfilePicture() async {
  //   try {
  //     final image = await ImagePicker().pickImage(
  //       source: ImageSource.gallery,
  //       imageQuality: 70,
  //       maxHeight: 512,
  //       maxWidth: 512,
  //     );

  //     if (image != null) {
  //       imageUploding.value = true;
  //       // Upload Inage
  //       final imageUrl =
  //           await userRepository.uploadImagge('Users/Image/Profile/', image);

  //       // update user Image Record
  //       Map<String, dynamic> json = {'ProfilePicture': imageUrl};
  //       await userRepository.updateSingleField(json);

  //       user.value.profilePicture = imageUrl;
  //       user.refresh();
  //       TLoaders.successSnakBar(
  //           title: 'Congratulations',
  //           message: 'Your Profile Image has been updated!.');
  //     }
  //   } catch (e) {
  //     TLoaders.errorSnakBar(
  //         title: 'Oh Snap!', message: 'Some thing went wrong: $e.');
  //     log(e.toString());
  //   } finally {
  //     imageUploding.value = false;
  //   }
  // }
}
