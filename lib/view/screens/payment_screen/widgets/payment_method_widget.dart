import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/auth/login_controller.dart';
import 'package:nx_shop/controllers/main/cart_controller.dart';
import 'package:nx_shop/controllers/main/payment_controller.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

class PayMentMethodWidget extends StatefulWidget {
  const PayMentMethodWidget({Key? key}) : super(key: key);

  @override
  _PayMentMethodWidgetState createState() => _PayMentMethodWidgetState();
}

class _PayMentMethodWidgetState extends State<PayMentMethodWidget> {
  final paymentController = Get.find<PaymentController>();
  final cartController = Get.find<CartController>();
  final loginController = Get.find<LoginController>();
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Paypal",
              image: 'assets/image/paypal.png',
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                //paymentController.removeGooglePay();
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Google Pay",
              image: 'assets/image/google.png',
              scale: 0.8,
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                // paymentController.makeGooglePay(
                //   amount: cartController.total.toString(),
                //   label: loginController.displayedUserName.value,
                // );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PaymentController>(
            builder: (_) => buildRadioPayment(
              name: "Credit Card",
              image: 'assets/image/credit.png',
              scale: 0.7,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
                //paymentController.removeGooglePay();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              MyText(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                myColor: MyColors.myBblack,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor:
                MaterialStateColor.resolveWith((states) => MyColors.myYellow),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
