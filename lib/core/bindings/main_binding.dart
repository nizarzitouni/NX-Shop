import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/category_controller.dart';
import 'package:nx_shop/controllers/main_controller.dart';
//
import '../../controllers/main/products_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController(), permanent: true);
    Get.put<ProductsController>(ProductsController(), permanent: true);
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
    // Get.lazyPut<LoginController>(() => LoginController());
  }
}
