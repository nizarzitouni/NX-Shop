import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/data/models/product_model.dart';

import '../../core/my_colors.dart';

class CartController extends GetxController {
  //
  var productsMap = {}.obs;

  //
  get productSubTotol => productsMap.entries
      .map((elemenOfMap) => elemenOfMap.key.price * elemenOfMap.value)
      .toList();
  get total =>
      productsMap.entries
          .map((elemenOfMap) => elemenOfMap.key.price * elemenOfMap.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2) ??
      0;

  //
  void addProductToCart(ProductModel productModel) {
    //
    if (productsMap.containsKey(productModel)) {
      productsMap[productModel] +=
          1; //add it to the model list with the same id
    } else {
      productsMap[productModel] = 1;
    }
  }

  //
  void removeProductsFromCart(ProductModel productModel) {
    if (productsMap.containsKey(productModel) &&
        productsMap[productModel] == 1) {
      productsMap.removeWhere((key, value) => key == productModel);
    } else {
      productsMap[productModel] -= 1;
    }
    // Get.snackbar(
    //   'Seccuss',
    //   "${productsMap[productModel]}",
    //   snackPosition: SnackPosition.BOTTOM,
    //   backgroundColor: MyColors.myGreen,
    //   colorText: MyColors.myWhite,
    //   borderRadius: 15,
    //   margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
    //   forwardAnimationCurve: Curves.elasticInOut,
    //   reverseAnimationCurve: Curves.easeOut,
    //   duration: const Duration(seconds: 2),
    // );
  }

  //
  void removeOneProductFromCart(ProductModel productModel) {
    productsMap.removeWhere((key, value) => key == productModel);
  }

  //
  void clearAllProductFromCart() {
    //
    if (productsMap.isEmpty) {
      Get.snackbar(
        'Error!',
        "Cart is Already Empty",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.myRed,
        colorText: MyColors.myWhite,
        borderRadius: 15,
        margin: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        duration: const Duration(seconds: 2),
      );
    } else {
      Get.defaultDialog(
        title: "Clear Cart Confirmation",
        middleText: "Are you sure you want to Clear your cart ?",
        titlePadding: const EdgeInsets.all(16),
        contentPadding: const EdgeInsets.all(16),
        actions: [
          ElevatedButton(
            onPressed: () {
              productsMap.clear();
              Get.back();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
              elevation: MaterialStateProperty.all(1.0),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(color: Colors.pink),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Colors.red),
            ),
            child: const Text('Clear'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(2)),
              elevation: MaterialStateProperty.all(1.0),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(color: MyColors.myYellow))),
              backgroundColor: MaterialStateProperty.all(MyColors.myYellow),
            ),
            child: const Text(
              'Cancel',
            ),
          ),
        ],
        backgroundColor: MyColors.myWhite.withOpacity(0.8),
        titleStyle: const TextStyle(color: MyColors.myBblack),
        middleTextStyle: const TextStyle(color: MyColors.myBblack),
      );
    }
  }

  //
  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
