import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/data/models/product_model.dart';
import 'package:nx_shop/data/services/category_service.dart';

class CategoryController extends GetxController {
  var categoriesNameList = <String>[].obs;

  var productsListByCategory = <ProductModel>[].obs;

  var isCategoryLoading = true.obs;
  var isAllCategoryLoading = false.obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    //Getting Categories from api
    getCategories();
  }

  //Getting the products from the api----------------------------------------
  void getCategories() async {
    List<String> categories = await CategoryService.getCategories();
    try {
      isCategoryLoading(true); //When its done it become false
      if (categories.isNotEmpty) {
        categoriesNameList.addAll(categories);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  //Getting the products from the api----------------------------------------
  getAllCategories(String categoryName) async {
    try {
      isAllCategoryLoading(true); //When its done it become false
      var productsByCategoryList =
          await CategoryService.getProductsByCategory(categoryName);
      productsListByCategory.value = productsByCategoryList;
    } catch (e) {
    } finally {
      isAllCategoryLoading(false);
    }
  }
}
