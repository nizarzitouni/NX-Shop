import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/routes/app_routes.dart';

class RegisterController extends GetxController {
  //
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  bool passwordIsVisible = false;
  bool isCheckBox = false;
  //
  FirebaseAuth auth = FirebaseAuth.instance;
  String displayedUserName = '';

  //Password visibility
  void changePasswordVisibility() {
    passwordIsVisible = !passwordIsVisible;
    update();
  }

  //
  void checkBox() {
    isCheckBox = !isCheckBox;
    update();
  }

  //
  void signUpUsingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    //
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayedUserName = name;
        auth.currentUser!.updateDisplayName(displayedUserName);
      });

      update();
      Get.offNamed(AppRoutes.MAINSCREEN);
    } on FirebaseAuthException catch (error) {
      String titile = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (error.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
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
  void signOut() async {
    //
  }
}
