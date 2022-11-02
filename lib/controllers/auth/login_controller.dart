import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_shop/data/models/facebook_model.dart';
import 'package:nx_shop/core/routes/app_routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/my_colors.dart';

class LoginController extends GetxController {
  //
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  bool passwordIsVisible = false;
  //
  FirebaseAuth auth = FirebaseAuth.instance;
  String displayedUserName = '';
  var displayedUserPhoto = '';
  //
  var googleAuth = GoogleSignIn();
  var facebookAuth = FacebookAuth.instance;
  FacebookModel facebookModel = FacebookModel();
  //
  var isSignIn = false;
  final GetStorage authBox = GetStorage();

  //Password visibility
  void changePasswordVisibilityLogin() {
    passwordIsVisible = !passwordIsVisible;
    update();
  }

  //
  void logInUsingFirebase(
      {required String email, required String password}) async {
    //
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayedUserName = auth.currentUser!.displayName!;
      });
      isSignIn = true;
      authBox.write("auth", isSignIn);
      update();
      Get.offNamed(AppRoutes.MAINSCREEN);
    } on FirebaseAuthException catch (error) {
      String titile = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else if (error.code == 'wrong-password') {
        message = 'Wrong password provided for that user.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        titile,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myGreen,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myRed,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
    }
  }

  //
  void googleSignUp() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleAuth.signIn();
      displayedUserName = googleUser!.displayName!;
      displayedUserPhoto = googleUser.photoUrl!;
      isSignIn = true;
      authBox.write("auth", isSignIn);

      update();
      Get.offNamed(AppRoutes.MAINSCREEN);
    } catch (error) {
      //
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myRed,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
    }
  }

  //
  void facebookSignUp() async {
    // Trigger the sign-in flow
    final LoginResult facebookLoginResult = await facebookAuth.login();

    if (facebookLoginResult.status == LoginStatus.success) {
      facebookModel = FacebookModel.fromJson(await facebookAuth.getUserData());
      displayedUserName = facebookModel.name!;
      displayedUserPhoto = facebookModel.picture!.data!.url!;
      isSignIn = true;
      authBox.write("auth", isSignIn);

      update();
      Get.offNamed(AppRoutes.MAINSCREEN);
    }
  }

  //
  void resetPassword(String email) async {
    //
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String titile = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        titile,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myGreen,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myRed,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
    }
  }

  //
  void logOutFromApp() async {
    try {
      await auth.signOut();
      await googleAuth.signOut();
      await facebookAuth.logOut();
      displayedUserName = '';
      displayedUserPhoto = '';
      isSignIn = false;
      authBox.write("auth", isSignIn);

      update();

      Get.offNamed(AppRoutes.WELCOMESCREEN);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myRed,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
    }
  }
}
