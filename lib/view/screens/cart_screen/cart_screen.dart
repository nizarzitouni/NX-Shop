import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/view/screens/cart_screen/widgets/cart_total.dart';

import '../../../controllers/main/cart_controller.dart';
import '../../../core/my_colors.dart';
import 'widgets/cart_product_card.dart';
import 'widgets/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text('Cart Items'),
          elevation: 0,
          backgroundColor:
              Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myYellow,
          actions: [
            IconButton(
              onPressed: () {
                //
                cartController.clearAllProductFromCart();
              },
              icon: Icon(
                Icons.backspace,
              ),
            ),
          ],
        ),
        body: Obx(
          () {
            if (cartController.productsMap.isEmpty) {
              return EmptyCart();
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 680,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            index: index,
                            productModels:
                                cartController.productsMap.keys.toList()[index],
                            quantity: cartController.productsMap.values
                                .toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                        itemCount: cartController.productsMap
                            .length, // controller.productsMap.length,
                      ),
                    ),
                    //
                    //
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 10),
                      child: CartTotal(),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
