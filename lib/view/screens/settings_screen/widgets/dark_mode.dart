import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import '../../../../controllers/main/setting_controller.dart';
import '../../../../core/my_colors.dart';
import '../../../../core/themes.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({Key? key}) : super(key: key);

  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //~~~~~~~~~~~~~~Icon and Text~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          buildIconWidget(),
          //~~~~~~~~~~~~~~Switch Btn~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          Switch(
            activeTrackColor:
                Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
            activeColor: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
            value: settingController.swithchValue.value,
            onChanged: (value) {
              ThemeController().changeTheme();
              settingController.swithchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          MyText(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            text: "Dark Mode".tr,
            myColor: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
