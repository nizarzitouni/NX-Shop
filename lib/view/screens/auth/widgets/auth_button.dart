import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
        minimumSize: const Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: MyText(
        text: text,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        myColor: MyColors.myWhite,
      ),
    );
  }
}
