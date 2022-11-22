import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/auth/login_controller.dart';
import 'package:nx_shop/controllers/main/payment_controller.dart';
import 'package:nx_shop/core/config/app_information.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/routes/app_routes.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  final TextEditingController phoneController = TextEditingController();
  int radioContinerIndes = 1;
  bool changeColors = false;

  final paymentController = Get.find<PaymentController>();
  final loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildRadioContiner(
          title: AppInformation.storeTitile,
          name: AppInformation.storeName,
          phone: AppInformation.storePhone,
          address: AppInformation.storeAdresse,
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value) {
            setState(() {
              radioContinerIndes = value!;
              changeColors = !changeColors;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Obx(
          () => buildRadioContiner(
            title: "Delivery",
            name: loginController.displayedUserName.value,
            address: paymentController.address.value,
            phone: paymentController.phoneNumber.value,
            value: 2,
            color: changeColors ? Colors.grey.shade300 : Colors.white,
            icon: InkWell(
              onTap: () {
                Get.defaultDialog(
                  title: "Enter Your Phone Number",
                  titleStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  radius: 10,
                  textCancel: " Cancel ",
                  confirmTextColor: Colors.black,
                  textConfirm: " Save ",
                  cancelTextColor: Colors.black,
                  onCancel: () {
                    Get.toNamed(AppRoutes.PAYMENTSCREEN);
                  },
                  onConfirm: () {
                    Get.back();
                    paymentController.phoneNumber.value = phoneController.text;
                  },
                  buttonColor:
                      Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                  content: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      controller: phoneController,
                      cursorColor: Colors.black,
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      onSubmitted: (value) {
                        phoneController.text = value;
                      },
                      decoration: InputDecoration(
                        fillColor: Get.isDarkMode
                            ? MyColors.myPink.withOpacity(0.1)
                            : MyColors.myYellow.withOpacity(0.2),
                        focusColor: Colors.red,
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Get.isDarkMode
                              ? MyColors.myPink
                              : MyColors.myYellow,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            phoneController.clear();
                          },
                          icon: const Icon(Icons.close, color: Colors.black),
                        ),
                        hintText: "Enter Your Phone Number",
                        hintStyle: const TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.contact_phone_outlined,
                color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                size: 20,
              ),
            ),
            onChanged: (int? value) {
              setState(() {
                radioContinerIndes = value!;
                changeColors = !changeColors;
              });
              paymentController.updatePosition();
            },
          ),
        ),
      ],
    );
  }

  Widget buildRadioContiner({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Radio(
            value: value,
            groupValue: radioContinerIndes,
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
            onChanged: (int? value) {
              onChanged(value);
            },
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: title,
                  myColor: MyColors.myBblack,
                ),
                const SizedBox(
                  height: 5,
                ),
                MyText(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  text: name,
                  myColor: MyColors.myBblack,
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    // const Text('🇪🇬+02 '),
                    MyText(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      text: phone == '' ? 'Enter Your Ohone Number' : phone,
                      myColor: MyColors.myBblack,
                    ),
                    const SizedBox(
                      width: 120,
                    ),
                    SizedBox(
                      child: icon,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Text(
                    address,
                    //maxLines: 3,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      color: MyColors.myBblack,
                    ),
                  ),
                ),
                // MyText(
                //   fontSize: 15,
                //   fontWeight: FontWeight.normal,
                //   text: address,
                //   myColor: MyColors.myBblack,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
