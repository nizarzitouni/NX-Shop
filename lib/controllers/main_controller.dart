import 'package:get/get.dart';
import 'package:nx_shop/view/screens/category_screen/category_screen.dart';
import 'package:nx_shop/view/screens/favorite_screen.dart';
import 'package:nx_shop/view/screens/home_screen/home_screen.dart';
import 'package:nx_shop/view/screens/settings_screen/settings_screen.dart';

class MainController extends GetxController {
  //
  RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ].obs;
  final title = [
    'NX  Shop',
    'Categories',
    'Favorites',
    'Settings',
  ].obs;
}
