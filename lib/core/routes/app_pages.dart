import 'package:get/get.dart';
import 'package:nx_shop/app/bindings/auth_binding.dart';
import 'package:nx_shop/view/screens/auth/forgot_password.dart';
import 'package:nx_shop/view/screens/auth/login_screen.dart';
import 'package:nx_shop/view/screens/auth/register_screen.dart';
import 'package:nx_shop/view/screens/welcome_screen.dart';

import '../../app/bindings/home_binding.dart';
import '../../app/ui/pages/home_page/home_page.dart';
import '../../app/ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => const UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.WELCOMESCREEN,
      page: () => const WelcomeScreen(),
      //binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LOGINSCREEN,
      page: () => LoginScreen(),
      binding: AuthBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.REGISTERSCREEN,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.FORGOTPASSWORDSCREEN,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
      transition: _defaultTransition,
    ),
  ];
}
