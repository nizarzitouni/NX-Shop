import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import '../../../../controllers/register_controller.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);
  final RegisterController registerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                registerController.checkBox();
              },
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: MyColors.myGrey,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: registerController.isCheckBox
                    ? Get.isDarkMode
                        ? Icon(
                            Icons.done,
                            color: MyColors.myPink,
                            size: 30,
                          )
                        : Image.asset('assets/icons/check.png')
                    : Container(),
              ),
            ),
            const SizedBox(width: 10.0),
            Row(
              children: [
                MyText(
                  text: 'I Accept ',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  myColor:
                      Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
                ),
                MyText(
                  text: 'termes & conditions',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  myColor:
                      Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
                  textUnderline: TextDecoration.underline,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
