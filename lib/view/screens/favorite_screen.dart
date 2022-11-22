import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/product_controller.dart';
import 'package:nx_shop/core/my_colors.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final productsController = Get.find<ProductController>();
  // final productsController =
  //     Get.put<ProductsController>(ProductsController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Obx(
          () {
            return productsController.favouritesList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //
                        SizedBox(
                          height: 100.0,
                          width: 100,
                          child: Image.asset('assets/image/heart.png'),
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'Please, add your favorites products.',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Get.isDarkMode
                                ? MyColors.myWhite
                                : MyColors.myBblack,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return buildFavItems(
                        image: productsController.favouritesList[index].image,
                        price: productsController.favouritesList[index].price,
                        titile: productsController.favouritesList[index].title,
                        productId: productsController.favouritesList[index].id,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: MyColors.myGrey,
                      );
                    },
                    itemCount: productsController.favouritesList.length,
                  );
          },
        ));
  }

  Widget buildFavItems({
    required String image,
    required num price,
    required String titile,
    required int productId,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //
                  Text(
                    titile,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color:
                          Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
                    ),
                  ),
                  //
                  const SizedBox(height: 10.0),
                  //
                  Text(
                    '\$$price',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color:
                          Get.isDarkMode ? MyColors.myWhite : MyColors.myBblack,
                    ),
                  ),
                ],
              ),
            ),
            //
            const Spacer(),
            //
            IconButton(
                onPressed: () {
                  productsController.manageFavourites(productId);
                },
                icon: Icon(
                  Icons.favorite,
                  color: MyColors.myRed,
                ))

            //
          ],
        ),
      ),
    );
  }
}
