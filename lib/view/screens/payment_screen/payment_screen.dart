import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/payment_controller.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';
import 'package:nx_shop/view/screens/payment_screen/widgets/delivery_container_widget.dart';
import 'package:nx_shop/view/screens/payment_screen/widgets/payment_method_widget.dart';

import '../../../controllers/main/cart_controller.dart';
import '../../../core/my_colors.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  final paymentController = Get.find<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text('Payment'),
        elevation: 0,
        backgroundColor:
            Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myYellow,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //
              MyText(
                  text: 'Shipping to:',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  myColor:
                      Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack),
              const SizedBox(height: 20.0),
              DeliveryContainerWidget(),
              const SizedBox(height: 20.0),
              MyText(
                  text: 'Payment Method:',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  myColor:
                      Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack),
              const SizedBox(height: 20.0),
              PayMentMethodWidget(),
              const SizedBox(height: 30.0),
              //
              Center(
                child: MyText(
                    text: "Total: ${cartController.total}\$",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    myColor:
                        Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack),
              ),
              const SizedBox(height: 20.0),

              Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      backgroundColor:
                          Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
