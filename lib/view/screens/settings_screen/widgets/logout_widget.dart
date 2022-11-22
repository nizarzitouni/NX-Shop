import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import '../../../../controllers/auth/login_controller.dart';
import '../../../../core/my_colors.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: "Logout Confirmation",
              middleText: "Are you sure you want to Log out from the app?",
              titlePadding: const EdgeInsets.all(16),
              contentPadding: const EdgeInsets.all(16),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    loginController.logOutFromApp();
                    Get.back();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                    elevation: MaterialStateProperty.all(1.0),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: Colors.pink),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text('Log out'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
                    elevation: MaterialStateProperty.all(1.0),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: const BorderSide(color: MyColors.myYellow))),
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
              middleTextStyle: const TextStyle(color: MyColors.myBblack),
            );
          },
          splashColor: Get.isDarkMode ? Colors.pink : Colors.green[100],
          borderRadius: BorderRadius.circular(12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              MyText(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                text: "Logout".tr,
                myColor: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
