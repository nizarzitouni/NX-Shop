import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_strings.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import '../../../../controllers/main/setting_controller.dart';
import '../../../../core/my_colors.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);

  final settingController = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //~~~~~~~~~~~~~~Icon~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: languageSettings,
                  ),
                  child: const Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                MyText(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  text: "Language".tr,
                  myColor: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ],
            ),
          ),
          //~~~~~~~~~~~~~~Drop Down Lang~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
          Container(
            width: 120,
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                width: 2,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                iconSize: 25,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text(
                      english,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: ene,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      arabic,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: ara,
                  ),
                  DropdownMenuItem(
                    child: Text(
                      france,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    value: frf,
                  ),
                ],
                value: settingController.langLocale,
                onChanged: (value) {
                  settingController.changeLanguage(value!);
                  Get.updateLocale(Locale(value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
