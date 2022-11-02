import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/themes.dart';
import 'package:nx_shop/controllers/auth/login_controller.dart';
import 'package:nx_shop/core/my_colors.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
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
            const SizedBox(height: 15.0),
            GetBuilder<LoginController>(
              builder: (_) {
                return TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Logout Confirmation",
                      middleText:
                          "Are you sure you want to Log out from the app?",
                      titlePadding: const EdgeInsets.all(16),
                      contentPadding: const EdgeInsets.all(16),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            loginController.logOutFromApp();
                            Get.back();
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(2)),
                            elevation: MaterialStateProperty.all(1.0),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                side: const BorderSide(color: Colors.pink),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.red),
                          ),
                          child: const Text('Log out'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(2)),
                            elevation: MaterialStateProperty.all(1.0),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: const BorderSide(
                                        color: MyColors.myYellow))),
                            backgroundColor:
                                MaterialStateProperty.all(MyColors.myYellow),
                          ),
                          child: const Text(
                            'Cancel',
                          ),
                        ),
                      ],
                      backgroundColor: MyColors.myWhite.withOpacity(0.8),
                      titleStyle: const TextStyle(color: MyColors.myBblack),
                      middleTextStyle:
                          const TextStyle(color: MyColors.myBblack),
                    );
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color:
                          Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
