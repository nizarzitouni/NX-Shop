import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //
  bool passwordIsVisible = false;
  bool isCheckBox = false;

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
}
