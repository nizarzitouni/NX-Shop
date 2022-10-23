import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/register_controller.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/size_config.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import 'widgets/auth_text_from_field_widget.dart';
import 'widgets/check_widget.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController registerController = Get.find();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.myWhite,
          elevation: 0,
        ),
        backgroundColor: MyColors.myWhite,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              Container(
                width: double.infinity,
                height: SizeConfig.screenHeight * 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //SIGN UP ROW
                      Row(
                        children: [
                          MyText(
                              text: 'SIGN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              myColor: MyColors.myYellow),
                          const SizedBox(width: 3.0),
                          MyText(
                              text: 'UP',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              myColor: MyColors.myBblack),
                        ],
                      ),
                      //
                      const SizedBox(height: 50.0),
                      //usename
                      //
                      AuthTextFromField(
                        controller: registerController.nameController,
                        validation: () {},
                        prefixIcon: Image.asset('assets/icons/user.png'),
                        suffixIcon: Text(''),
                        hintText: 'Username',
                      ),
                      const SizedBox(height: 20.0),
                      //Email
                      //
                      AuthTextFromField(
                        controller: registerController.emailController,
                        validation: () {},
                        prefixIcon: Image.asset('assets/icons/email.png'),
                        suffixIcon: Text(''),
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 20.0),
                      //pas
                      //
                      AuthTextFromField(
                        controller: registerController.passwordController,
                        validation: () {},
                        prefixIcon: Image.asset('assets/icons/lock.png'),
                        suffixIcon: Text(''),
                        hintText: 'Password',
                        obscureText: true,
                      ),

                      //
                      const SizedBox(height: 50.0),
                      //
                      //
                      CheckWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
