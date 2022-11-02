import 'package:flutter/material.dart';
import 'package:nx_shop/core/my_colors.dart';

class AuthTextFromField extends StatelessWidget {
  const AuthTextFromField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    required this.validation,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final Function validation;
  final bool obscureText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: MyColors.myBblack,
      style: TextStyle(color: MyColors.myBblack),
      keyboardType: TextInputType.text,
      validator: (value) => validation(value),
      decoration: InputDecoration(
        fillColor: MyColors.myGreyTwo,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: MyColors.myBblack.withOpacity(.5),
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.myWhite),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.myWhite),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.myWhite),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.myWhite),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
