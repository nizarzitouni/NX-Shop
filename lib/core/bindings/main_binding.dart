import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/cart_controller.dart';
import 'package:nx_shop/controllers/main/category_controller.dart';
import 'package:nx_shop/controllers/main_controller.dart';
//
import '../../controllers/main/products_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductsController>(ProductsController());
    Get.put<CategoryController>(CategoryController());
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
    Get.put<MainController>(MainController(), permanent: true);
  }
}
