import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_shop/data/models/product_model.dart';
import 'package:nx_shop/data/services/product_services.dart';

class ProductController extends GetxController {
  //
  var productsList = <ProductModel>[].obs;
  var isLoading = true.obs;
  //
  var favouritesList = <ProductModel>[].obs;
  //loacal caching
  var storage = GetStorage();

  //~~~~~~~~~~~~~~Search~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  var searchList = <ProductModel>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    //Getting the local favourites list if there is any
    List? storedFavList = storage.read<List>('isFavoritesList');
    if (storedFavList != null) {
      favouritesList =
          storedFavList.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    //Getting product from api
    //getProducts();
    super.onInit();
  }

  @override
  void onReady() {
    //~~~~~~~~~~~~~~Get data from firebase~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    try {
      isLoading(true);
      productsList.bindStream(ProductService.productStream());
    } finally {
      isLoading(false);
    }
    super.onReady();
  }

  //Getting the products from fake api----------------------------------------
  void getProducts() async {
    List<ProductModel> products = await ProductService.getProducts();
    try {
      isLoading(true); //When its done it become false
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  //Favorites logic----------------------------------------------------------
  void manageFavourites(productId) async {
    var removeAtIndex =
        favouritesList.indexWhere((product) => product.id == productId);
    if (removeAtIndex >= 0) {
      favouritesList.removeAt(removeAtIndex);
      await storage.remove('isFavoritesList');
    } else {
      favouritesList
          .add(productsList.firstWhere((product) => product.id == productId));
      //
      await storage.write('isFavoritesList', favouritesList);
    }
  }

  bool isFavourites(productId) {
    //isFavourites.value == !isFavourites.value;
    return favouritesList.any((product) => product.id == productId);
  }
  //--------------------------------------------------------------------------

  //~~~~~~~~~~~~~~SearchBar Logic~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  void addSearchToList(String searchName) {
    searchList.value = productsList.where((search) {
      return search.title
              .toLowerCase()
              .contains(searchName.toLowerCase()) || //filter by name
          search.price.toString().contains(searchName); //filter by preice
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
