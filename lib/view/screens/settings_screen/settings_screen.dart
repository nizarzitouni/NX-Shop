import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/auth/login_controller.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';
import 'package:nx_shop/view/screens/settings_screen/widgets/dark_mode.dart';
import 'package:nx_shop/view/screens/settings_screen/widgets/language_widget.dart';
import 'package:nx_shop/view/screens/settings_screen/widgets/logout_widget.dart';
import 'package:nx_shop/view/screens/settings_screen/widgets/profile.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          MyText(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            myColor: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
