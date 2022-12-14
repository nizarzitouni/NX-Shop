// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color myColor;
  final TextDecoration textUnderline;
  const MyText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.myColor,
    this.textUnderline = TextDecoration.none,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: textUnderline,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: myColor,
      ),
    );
  }
}
