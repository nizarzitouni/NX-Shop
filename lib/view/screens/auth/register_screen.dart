import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/register_controller.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/my_strings.dart';
import 'package:nx_shop/core/routes/app_routes.dart';
import 'package:nx_shop/core/size_config.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import 'widgets/auth_button.dart';
import 'widgets/auth_text_from_field_widget.dart';
import 'widgets/bottom_container.dart';
import 'widgets/check_widget.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController registerController = Get.find();
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
                              text: 'SIGN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              myColor: Get.isDarkMode
                                  ? MyColors.myPink
                                  : MyColors.myYellow,
                            ),
                            const SizedBox(width: 3.0),
                            MyText(
                              text: 'UP',
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
                        //usename
                        //
                        AuthTextFromField(
                          controller: registerController.nameController,
                          validation: (value) {
                            if (value.toString().length <= 4 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid neme';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.person,
                                  color: MyColors.myPink,
                                  size: 30,
                                )
                              : Image.asset('assets/icons/user.png'),
                          suffixIcon: Text(''),
                          hintText: 'Username',
                        ),
                        const SizedBox(height: 20.0),
                        //Email
                        //
                        AuthTextFromField(
                          controller: registerController.emailController,
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
                                  Icons.mail,
                                  color: MyColors.myPink,
                                  size: 30,
                                )
                              : Image.asset('assets/icons/email.png'),
                          suffixIcon: Text(''),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20.0),
                        //pas
                        //
                        GetBuilder<RegisterController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: registerController.passwordController,
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
                                  registerController.changePasswordVisibility();
                                },
                                icon: registerController.passwordIsVisible
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
                              obscureText: registerController.passwordIsVisible
                                  ? false
                                  : true,
                            );
                          },
                        ),

                        //
                        const SizedBox(height: 50.0),
                        //
                        //
                        CheckWidget(),
                        //
                        //
                        const SizedBox(height: 40.0),
                        AuthButton(
                          text: 'Sign Up',
                          onPressed: () {
                            //Sign Up
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomConatiner(
                text: 'Already have an Account?',
                onPressed: () {
                  Get.offNamed(AppRoutes.LOGINSCREEN);
                },
                textBtn: 'Log In',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
