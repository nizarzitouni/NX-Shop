import 'package:flutter/material.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: MyColors.myBblack.withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/icons/check.png'),
          ),
        ),
        const SizedBox(width: 10.0),
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyText(
              text: 'I Accept ',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              myColor: MyColors.myBblack,
            ),
            MyText(
              text: 'termes & conditions',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              myColor: MyColors.myBblack,
              textDecoration: TextDecoration.underline,
            ),
          ],
        ),
      ],
    );
  }
}
