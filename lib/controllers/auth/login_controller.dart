import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  bool passwordIsVisible = false;

  //Password visibility
  void changePasswordVisibilityLogin() {
    passwordIsVisible = !passwordIsVisible;
    update();
  }
}
