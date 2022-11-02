import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/view/screens/auth/widgets/auth_button.dart';
import 'package:nx_shop/view/screens/auth/widgets/auth_text_from_field_widget.dart';

import '../../../controllers/auth/login_controller.dart';
import '../../../core/my_colors.dart';
import '../../../core/my_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? MyColors.myBblack : MyColors.myWhite,
            ),
          ),
        ),
        backgroundColor: context.theme.backgroundColor,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: Get.isDarkMode
                            ? MyColors.darkModeBlack
                            : MyColors.myWhite,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'If you want to recover your accoun, then please provice your email ID bellow..',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? MyColors.darkModeBlack
                          : MyColors.myWhite,
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  //
                  Image.asset('assets/image/forgetpass copy.png', width: 250),
                  //
                  const SizedBox(height: 50.0),
                  AuthTextFromField(
                    controller: loginController.emailController,
                    validation: (value) {
                      if (value.toString().length <= 4 ||
                          !RegExp(validationEmail).hasMatch(value)) {
                        return 'Invalid Email';
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Icon(
                            Icons.email,
                            color: MyColors.myPink,
                            size: 30,
                          )
                        : Image.asset('assets/icons/email.png'),
                    suffixIcon: Text(''),
                    hintText: 'Email Adresse',
                  ),
                  const SizedBox(height: 30.0),
                  GetBuilder<LoginController>(
                    builder: (_) {
                      return AuthButton(
                          text: 'SEND',
                          onPressed: () {
                            //
                            if (formKey.currentState!.validate()) {
                              String email =
                                  loginController.emailController.text.trim();
                              loginController.resetPassword(email);
                            }
                          });
                    },
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
