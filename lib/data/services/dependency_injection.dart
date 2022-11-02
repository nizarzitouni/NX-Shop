import 'package:firebase_core/firebase_core.dart';

import '../../controllers/auth/login_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
// firebase init
    // await Firebase.initializeApp(
    //     options: DefaultFirebaseOptions.currentPlatform,
    //   );

    await Firebase.initializeApp();

    await GetStorage.init();

    Get.put<LoginController>(LoginController());
  }
}
