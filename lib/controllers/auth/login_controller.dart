import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_shop/core/my_strings.dart';
import 'package:nx_shop/data/models/facebook_model.dart';
import 'package:nx_shop/core/routes/app_routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nx_shop/data/services/user_helper.dart';
import '../../core/constants.dart';
import '../../core/my_colors.dart';

class LoginController extends GetxController {
  //
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  bool passwordIsVisible = false;
  //
  var displayedUserName = ''.obs;
  var displayedUserPhoto = ''.obs;
  var displayUserEmail = ''.obs;
  //
  var auth = FirebaseAuth.instance;
  var fireInst = FirebaseFirestore.instance;

  var googleAuth = GoogleSignIn();
  var facebookAuth = FacebookAuth.instance;
  FacebookModel facebookModel = FacebookModel();
  //
  var isSignIn = false;
  final GetStorage authBox = GetStorage();
  //
  var storage = GetStorage();
  //~~~~~~~~~~~~~~Get the user credentials from firestore~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  User? get userProfile => auth.currentUser;
  //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  @override
  Future<void> onInit() async {
    await storage.write('Lang', ene);
    //googleSignUp();
    //Or
    displayedUserName.value =
        userProfile != null ? userProfile!.displayName! : '';
    displayUserEmail.value = userProfile != null ? userProfile!.email! : '';
    displayedUserPhoto.value =
        userProfile != null ? userProfile!.photoURL! : '';
    super.onInit();
  }

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
        displayedUserName.value = auth.currentUser!.displayName!;
        displayUserEmail.value = auth.currentUser!.email!;
      });
      isSignIn = true;
      authBox.write("auth", isSignIn);
      update();
      //
      //UserHelper.saveUser(auth.currentUser!);
      //
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
      displayedUserName.value = googleUser!.displayName!;
      displayedUserPhoto.value = googleUser.photoUrl!;
      displayUserEmail.value = googleUser.email;
      isSignIn = true;
      authBox.write("auth", isSignIn);
      // UserHelper.saveUser(googleUser);

      //~~~~~~~~~~~~~~Save Credenctials of google auths in firestore~~~~~~~~~~~~~~
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );
      await auth.signInWithCredential(credential);

      await saveUserCradentialsToFirestore(
          name: googleUser.displayName!,
          email: googleUser.email,
          authType: AuthenticationType.googleAuth.toString());
      //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
      displayedUserName.value = facebookModel.name!;
      displayedUserPhoto.value = facebookModel.picture!.data!.url!;
      isSignIn = true;
      authBox.write("auth", isSignIn);

      await saveUserCradentialsToFirestore(
          name: facebookModel.name!,
          email: facebookModel.email!,
          authType: AuthenticationType.FacebookAuth.toString());

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
      displayedUserName.value = '';
      displayedUserPhoto.value = '';
      displayUserEmail.value = '';
      isSignIn = false;
      authBox.write("auth", isSignIn);
      await storage.remove('isFavoritesList');
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

  //Saving user info to firestore DB---------------------------
  saveUserCradentialsToFirestore(
      {required String name,
      required String email,
      required String authType}) async {
    final lastTimeAuth = DateTime.now().millisecondsSinceEpoch;
    //get the user with the same email
    var querySnapshots = await fireInst
        .collection('authenticated_users_credentials')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshots.docs.isNotEmpty) {
      String userDocId = querySnapshots.docs[0].id;
      await fireInst
          .collection('authenticated_users_credentials')
          .doc(userDocId)
          .update({
        "last_time_auth": lastTimeAuth,
      });
    } else {
      await fireInst.collection('authenticated_users_credentials').add({
        "username": name,
        "email": email,
        "auth_type": authType,
        "last_time_auth": lastTimeAuth,
      });
    }
  }
}
