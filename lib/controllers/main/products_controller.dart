import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_shop/data/models/product_modle.dart';
import 'package:nx_shop/data/services/product_services.dart';

class ProductsController extends GetxController {
  //
  var productsList = <ProductModel>[].obs;
  var isLoading = true.obs;
  //
  var favouritesList = <ProductModel>[].obs;
  //loacal caching
  var storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    //Getting the local favourites list if there is any
    List? storedFavList = storage.read<List>('isFavoritesList');
    if (storedFavList != null) {
      favouritesList =
          storedFavList.map((e) => ProductModel.fromJson(e)).toList().obs;
    }
    //Getting product from api
    getProducts();
  }

  void getProducts() async {
    //
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

  //Favorites logic
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
}
