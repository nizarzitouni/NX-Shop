import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/view/global_widgets/my_text.dart';

import '../../../../controllers/main/cart_controller.dart';
import '../../../../controllers/main/category_controller.dart';
import '../../../../controllers/main/products_controller.dart';
import '../../../../core/my_colors.dart';
import '../../../../data/models/product_model.dart';
import '../../product_details_screen/product_details_screen.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({
    required this.categoryTitle,
    Key? key,
  }) : super(key: key);

  final productsController = Get.find<ProductsController>();

  final cartController = Get.find<CartController>();

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor:
            Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myYellow,
      ),
      body: Obx(() {
        if (categoryController.isAllCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
            ),
          );
        } else {
          return GridView.builder(
            itemCount: categoryController.productsListByCategory.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                  image: categoryController.productsListByCategory[index].image,
                  price: categoryController.productsListByCategory[index].price,
                  rate: categoryController
                      .productsListByCategory[index].rating.rate,
                  productId:
                      categoryController.productsListByCategory[index].id,
                  productModels:
                      categoryController.productsListByCategory[index],
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                          productModel:
                              categoryController.productsListByCategory[index],
                        ));
                  });
            },
          );
        }
      }),
    );
  }

  Widget buildCardItems({
    required String image,
    required num price,
    required num rate,
    required int productId,
    required ProductModel productModels,
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
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        productsController.manageFavourites(productId);
                      },
                      icon: productsController.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
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
                        color: MyColors.myYellow,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              myColor: Colors.white,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
