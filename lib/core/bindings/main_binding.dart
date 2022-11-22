import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/cart_controller.dart';
import 'package:nx_shop/controllers/main/category_controller.dart';
import 'package:nx_shop/controllers/main/payment_controller.dart';
import 'package:nx_shop/controllers/main/setting_controller.dart';
import 'package:nx_shop/controllers/main_controller.dart';
//
import '../../controllers/main/product_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
    Get.put<CategoryController>(CategoryController());
    Get.put<SettingController>(SettingController());
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
    Get.lazyPut<PaymentController>(() => PaymentController(), fenix: true);
    Get.put<MainController>(MainController(), permanent: true);
  }
}
