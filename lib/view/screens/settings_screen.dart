import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/app/ui/theme/themes.dart';
import 'package:nx_shop/core/my_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
          onPressed: () {
            //
            ThemeController().changeTheme();
          },
          child: Text(
            'Dark Mode',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
            ),
          ),
        ),
      ),
    );
  }
}
