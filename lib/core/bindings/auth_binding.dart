import 'package:get/get.dart';
import 'package:nx_shop/controllers/auth/login_controller.dart';

import '../../controllers/auth/register_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
