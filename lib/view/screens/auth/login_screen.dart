import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/auth/login_controller.dart';
import 'package:nx_shop/view/screens/auth/widgets/auth_button.dart';

import '../../../core/my_colors.dart';
import '../../../core/my_strings.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/size_config.dart';
import '../../global_widgets/my_text.dart';
import 'widgets/auth_text_from_field_widget.dart';
import 'widgets/bottom_container.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController loginController = Get.find();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:
              Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myWhite,
          elevation: 0,
        ),
        backgroundColor:
            Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myWhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              Container(
                width: double.infinity,
                height: SizeConfig.screenHeight * .78,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        //SIGN UP ROW
                        Row(
                          children: [
                            MyText(
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              myColor: Get.isDarkMode
                                  ? MyColors.myPink
                                  : MyColors.myYellow,
                            ),
                            const SizedBox(width: 3.0),
                            MyText(
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              myColor: Get.isDarkMode
                                  ? MyColors.myWhite
                                  : MyColors.myBblack,
                            ),
                          ],
                        ),
                        //
                        const SizedBox(height: 50.0),
                        //email
                        //
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
                        const SizedBox(height: 20.0),
                        //pas
                        //
                        GetBuilder<LoginController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: loginController.passwordController,
                              validation: (value) {
                                if (value.toString().length <= 6) {
                                  return 'Pssword should be longet or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Icon(
                                      Icons.lock_outline_rounded,
                                      color: MyColors.myPink,
                                      size: 30,
                                    )
                                  : Image.asset('assets/icons/lock.png'),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  loginController
                                      .changePasswordVisibilityLogin();
                                },
                                icon: loginController.passwordIsVisible
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: MyColors.myBblack,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: MyColors.myBblack,
                                      ),
                              ),
                              hintText: 'Password',
                              obscureText: loginController.passwordIsVisible
                                  ? false
                                  : true,
                            );
                          },
                        ),
                        //
                        //
                        //Forgot pass text
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.FORGOTPASSWORDSCREEN);
                            },
                            child: MyText(
                              text: 'Forget Passowrd?',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              myColor: Get.isDarkMode
                                  ? MyColors.myWhite
                                  : MyColors.myBblack,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        //btn
                        GetBuilder<LoginController>(
                          builder: (_) {
                            return AuthButton(
                              text: 'Log In',
                              onPressed: () {
                                //Sign In
                                if (formKey.currentState!.validate()) {
                                  String email = loginController
                                      .emailController.text
                                      .trim();
                                  String password = loginController
                                      .passwordController.text
                                      .trim();
                                  loginController.logInUsingFirebase(
                                    email: email,
                                    password: password,
                                  );
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20.0),
                        MyText(
                          text: 'OR',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          myColor: Get.isDarkMode
                              ? MyColors.myWhite
                              : MyColors.myBblack,
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GetBuilder<LoginController>(
                              builder: (_) {
                                return InkWell(
                                    onTap: () {
                                      loginController.googleSignUp();
                                    },
                                    child:
                                        Image.asset('assets/icons/google.png'));
                              },
                            ),
                            const SizedBox(width: 10.0),
                            GetBuilder<LoginController>(
                              builder: (_) {
                                return InkWell(
                                    onTap: () {
                                      loginController.facebookSignUp();
                                    },
                                    child: Image.asset(
                                        'assets/icons/facebook.png'));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomConatiner(
                text: 'Don\'t have an Account?',
                onPressed: () {
                  Get.offNamed(AppRoutes.REGISTERSCREEN);
                },
                textBtn: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
