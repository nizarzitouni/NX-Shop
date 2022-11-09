import 'package:get/get.dart';
import 'package:nx_shop/core/bindings/auth_binding.dart';
import 'package:nx_shop/core/bindings/main_binding.dart';
import 'package:nx_shop/view/screens/auth/forgot_password_screen.dart';
import 'package:nx_shop/view/screens/auth/login_screen.dart';
import 'package:nx_shop/view/screens/auth/register_screen.dart';
import 'package:nx_shop/view/screens/cart_screen/cart_screen.dart';
import 'package:nx_shop/view/screens/category_screen/category_screen.dart';
import 'package:nx_shop/view/screens/favorite_screen.dart';
import 'package:nx_shop/view/screens/home_screen/home_screen.dart';
import 'package:nx_shop/view/screens/main_screen.dart';
import 'package:nx_shop/view/screens/product_details_screen/product_details_screen.dart';
import 'package:nx_shop/view/screens/settings_screen.dart';
import 'package:nx_shop/view/screens/welcome_screen.dart';

import 'app_routes.dart';

const _defaultTransition = Transition.native;

class AppPages {
  static const mainScreen = AppRoutes.MAINSCREEN;
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.WELCOMESCREEN,
      page: () => const WelcomeScreen(),
      transition: _defaultTransition,
    ),
    //Auth Binding
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
      transition: _defaultTransition,
    ),

    //
    //
    //
    //
    //Main Binding
    GetPage(
      //nav bar with appbar
      name: AppRoutes.MAINSCREEN,
      page: () => MainScreen(),
      binding: MainBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.HOMESCREEN,
      page: () => HomeScreen(),
      binding: MainBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.CATEGORYSCREEN,
      page: () => CategoryScreen(),
      binding: MainBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.FAVORITESCREEN,
      page: () => FavoritesScreen(),
      binding: MainBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SETTINGSSCREEN,
      page: () => SettingsScreen(),
      binding: MainBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.CARTSCREEN,
      page: () => CartScreen(),
      binding: MainBinding(),
      transition: _defaultTransition,
    ),
  ];
}
