import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/routes/app_routes.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/image/getting_statrted.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: MyColors.myBblack.withOpacity(.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100.0),
                //
                //Welcome
                //
                Container(
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: MyColors.myBblack.withOpacity(.4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: MyText(
                      text: 'Welcome',
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                      myColor: MyColors.myWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                //
                //NX SHOP
                //
                Container(
                  height: 60,
                  width: 230,
                  decoration: BoxDecoration(
                    color: MyColors.myBblack.withOpacity(.4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        text: 'NX',
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        myColor: MyColors.myYellow,
                      ),
                      const SizedBox(width: 7.0),
                      MyText(
                        text: 'Shop',
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                        myColor: MyColors.myWhite,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 250.0),
                //
                //Get Start
                //
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.myYellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  onPressed: () {
                    Get.offNamed(AppRoutes.LOGINSCREEN);
                    //debugPrint('---------------------- ----------------------');
                  },
                  child: MyText(
                    text: 'Get Start',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    myColor: MyColors.myWhite,
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                      text: 'Don\'t have an Account?',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      myColor: MyColors.myWhite,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed(AppRoutes.REGISTERSCREEN);
                      },
                      child: MyText(
                        text: 'Sign Up',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        myColor: MyColors.myWhite,
                        textDecoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
