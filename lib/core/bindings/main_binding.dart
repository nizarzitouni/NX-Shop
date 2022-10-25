import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/category_controller.dart';
import 'package:nx_shop/controllers/main/favorite_controller.dart';
import 'package:nx_shop/controllers/main/settings_controller.dart';
import 'package:nx_shop/controllers/main_controller.dart';
import '../../app/controllers/home_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<FavoriteController>(() => FavoriteController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
