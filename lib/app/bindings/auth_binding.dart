import 'package:get/get.dart';
import 'package:nx_shop/controllers/auth/login_controller.dart';

import '../../controllers/auth/register_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
