import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/product_controller.dart';
import 'package:nx_shop/core/my_colors.dart';
//import 'package:udemy_shop_app/logic/controllers/product_controller.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);

  final productController = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) {
        return TextFormField(
          //TODO fix the color
          //style: TextStyle(color: MyColors.myBblack),
          controller: productController.searchTextController,
          cursorColor: MyColors.myBblack,
          keyboardType: TextInputType.text,
          onChanged: (searchName) {
            productController.addSearchToList(searchName);
          },
          decoration: InputDecoration(
            fillColor: MyColors.myWhite,
            focusColor: MyColors.myRed,
            prefixIcon: const Icon(
              Icons.search,
              color: MyColors.myGrey,
            ),
            suffixIcon: productController.searchTextController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      productController.clearSearch();
                      //debugPrint('---------------------- ----------------------');
                    },
                    icon: const Icon(
                      Icons.close,
                      color: MyColors.myBblack,
                    ),
                  )
                : Container(),
            hintText: "Search with name & price",
            hintStyle: const TextStyle(
              color: MyColors.myGreyTwo,
              fontSize: 16,
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
        );
      },
    );
  }
}
