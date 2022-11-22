import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/cart_controller.dart';
import 'package:nx_shop/controllers/main/product_controller.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';
import 'package:nx_shop/view/screens/product_details_screen/product_details_screen.dart';

import '../../../../data/models/product_model.dart';

class CardItems extends StatelessWidget {
  CardItems({Key? key}) : super(key: key);

  final productsController = Get.find<ProductController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (productsController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
          ),
        );
      } else {
        return Expanded(
          child: productsController.searchList.isEmpty &&
                  productsController.searchTextController.text.isNotEmpty
              ? Get.isDarkMode
                  ? Image.asset('assets/image/search_empty_dark.png')
                  : Image.asset('assets/image/search_empty_light.png')
              : GridView.builder(
                  itemCount: productsController.searchList.isEmpty
                      ? productsController.productsList.length
                      : productsController.searchList.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 9.0,
                    crossAxisSpacing: 6.0,
                    maxCrossAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    if (productsController.searchList.isEmpty) {
                      return buildCardItems(
                          image: productsController.productsList[index].image,
                          price: productsController.productsList[index].price,
                          rate: productsController
                              .productsList[index].rating.rate,
                          productId: productsController.productsList[index].id,
                          productModel: productsController.productsList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModel:
                                      productsController.productsList[index],
                                ));
                          });
                    } else {
                      return buildCardItems(
                          image: productsController.searchList[index].image,
                          price: productsController.searchList[index].price,
                          rate:
                              productsController.searchList[index].rating.rate,
                          productId: productsController.searchList[index].id,
                          productModel: productsController.searchList[index],
                          onTap: () {
                            Get.to(() => ProductDetailsScreen(
                                  productModel:
                                      productsController.searchList[index],
                                ));
                          });
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems({
    required String image,
    required num price,
    required num rate,
    required int productId,
    required ProductModel productModel,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              //==============================================================
              //Heart andCart Row
              //
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        productsController.manageFavourites(productId);
                      },
                      icon: productsController.isFavourites(productId)
                          ? Icon(
                              Icons.favorite,
                              color: Get.isDarkMode
                                  ? MyColors.myPink
                                  : MyColors.myYellow,
                            )
                          : Icon(
                              Icons.favorite_outline,
                              color: Get.isDarkMode
                                  ? MyColors.myPink
                                  : MyColors.myYellow,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModel);
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode
                            ? MyColors.myPink
                            : MyColors.myYellow,
                      ),
                    ),
                  ],
                ),
              ),
              //==============================================================
              //Image Container
              //
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: MyColors.myWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              //==============================================================
              //Price and Rating  Row
              //
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? MyColors.myPink
                            : MyColors.myYellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              myColor: MyColors.myWhite,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: MyColors.myWhite,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //
              //=================================>
            ],
          ),
        ),
      ),
    );
  }
}
