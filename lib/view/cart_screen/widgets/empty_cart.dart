import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/routes/app_routes.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
          ),
          const SizedBox(height: 40.0),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your Cart is ',
                  style: TextStyle(
                    color:
                        Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'Empty',
                  style: TextStyle(
                    color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            'Add items to get Started!!',
            style: TextStyle(
              color: Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          //
          const SizedBox(height: 50.0),
          //
          SizedBox(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
                backgroundColor:
                    Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
              ),
              onPressed: () {
                //
                Get.toNamed(AppRoutes.MAINSCREEN);
              },
              child: Text(
                'Go to Home',
                style: TextStyle(
                  fontSize: 20.0,
                  color: MyColors.myWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
