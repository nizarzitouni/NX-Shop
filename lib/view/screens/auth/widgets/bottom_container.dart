import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

class BottomConatiner extends StatelessWidget {
  const BottomConatiner(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.textBtn})
      : super(key: key);

  final String text;
  final String textBtn;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            myColor: MyColors.myWhite,
          ),
          TextButton(
            onPressed: onPressed,
            child: MyText(
              text: textBtn,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              myColor: MyColors.myWhite,
              textUnderline: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
