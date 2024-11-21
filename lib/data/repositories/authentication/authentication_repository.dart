import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store_web_adimn/routes/routes.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Get Authenticated User Dota
  User? get authUser => _auth.currentUser;

  // Get IsAuthenticated User
  bool get isAuthenticated => _auth.currentUser != null;
  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    // screenRedirect();
    _auth.setPersistence(Persistence.LOCAL);
    super.onReady();
  }

//.......Fuction Show Relevant Screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      // Initialize User Specific Storaqe
      // await TLocalStorage.init(user.uid);
      Get.offAllNamed(TRoutes.dashboard);
    } else {
      Get.offAllNamed(TRoutes.login);
    }
  }
  //   else {
  //     Local Storage
  //     deviceStorage.writeIfNull('isFirstTime', true);
  //     deviceStorage.read('isFirstTime') != true
  //         ? Get.offAll(() => const LoginScreen())
  //         : Get.offAll(() => const OnbordingScreen());
  //   }
  // }

/*..............................Email & Password sign-In..............................*/
  ///... (Email Authentication) - Signin
  // Future<UserCredential> loginWithEmaitAndPassword(
  //     {required email, required password}) async {
  //   try {
  //     return await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(code: e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(code: e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(code: e.code).message;
  //   } catch (e) {
  //     throw 'somethinq went wrong. Please try again';
  //   }
  // }

  ///... (Email Authentication) - MAIL VERIFICATION
  // Future<void> sendEmailVerification() async {
  //   try {
  //     await auth.currentUser?.sendEmailVerification();
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(code: e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(code: e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(code: e.code).message;
  //   } catch (e) {
  //     throw 'somethinq went wrong. Please try again';
  //   }
  // }

  ///... (Email Authentication) - FORGET PASSWORD
  // Future<void> sendPasswordResetEmail({required String email}) async {
  //   try {
  //     await auth.sendPasswordResetEmail(email: email);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(code: e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(code: e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(code: e.code).message;
  //   } catch (e) {
  //     throw 'somethinq went wrong. Please try again';
  //   }
  // }

  ///... (Email Authentication) - ReAuthenticate User
  // Future<void> reAuthenticateWithEmaitAndPassword(
  //     String email, String password) async {
  //   try {
  //     // create a credential
  //     AuthCredential credential =
  //         EmailAuthProvider.credential(email: email, password: password);

  //     await auth.currentUser!.reauthenticateWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(code: e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(code: e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(code: e.code).message;
  //   } catch (e) {
  //     throw 'somethinq went wrong. Please try again';
  //   }
  // }

/*..............................Federated identity & social sign-in..............................*/
  ///... (IGoogteAutnenticationl) - GOOGLE

  ///... (FacebookAuthentication) - FACEBOOK

/*............................... ./end Federated identity & social sign-in..............................*/
  ///... (Logoutuser) - Valid for any authentication.
  // Future<void> logout() async {
  //   try {
  //     await GoogleSignIn().signOut();
  //     await FirebaseAuth.instance.signOut();
  //     Get.offAll(() => const LoginScreen());
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(code: e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(code: e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(code: e.code).message;
  //   } catch (e) {
  //     throw 'somethinq went wrong. Please try again';
  //   }
  // }

  ///... (Deteteuser) - Remove user Auth and Firestone Account.
  // Future<void> deleteAccount() async {
  //   try {
  //     await UserRepository.instance.removeUserRecord(auth.currentUser!.uid);

  //     await auth.currentUser?.delete();
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(code: e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(code: e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(code: e.code).message;
  //   } catch (e) {
  //     throw 'somethinq went wrong. Please try again';
  //   }
  // }
}
