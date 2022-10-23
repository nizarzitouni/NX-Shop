import 'package:get/get.dart';
import 'package:nx_shop/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<loginController>(() => loginController());
  }
}
