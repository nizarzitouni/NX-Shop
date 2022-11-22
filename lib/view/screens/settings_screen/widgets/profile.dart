import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import '../../../../controllers/auth/login_controller.dart';
import '../../../../controllers/main/setting_controller.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);

  final settingController = Get.find<SettingController>();
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      loginController.displayedUserPhoto.value,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    text: settingController
                        .capitalize(loginController.displayedUserName.value),
                    myColor: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  MyText(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    text: loginController.displayUserEmail.value,
                    myColor: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
