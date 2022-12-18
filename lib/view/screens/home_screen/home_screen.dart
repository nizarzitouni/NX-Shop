import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';
import 'package:nx_shop/view/screens/home_screen/widgets/card_items.dart';
import 'package:nx_shop/view/screens/home_screen/widgets/search_form_text.dart';

import '../../../core/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Text FindYour INSPERATION
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color:
                    Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myYellow,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //
                    MyText(
                      text: 'FindYour',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      myColor: MyColors.myWhite,
                    ),
                    const SizedBox(height: 5.0),
                    MyText(
                      text: 'INSPERATION',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      myColor: MyColors.myWhite,
                    ),
                    const SizedBox(height: 20.0),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            //
            //
            //Products
            const SizedBox(height: 10),
            //Categories Text
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: MyText(
                  myColor: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  text: "Categories",
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
