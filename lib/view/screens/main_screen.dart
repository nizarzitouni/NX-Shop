import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_shop/controllers/main/cart_controller.dart';
import 'package:nx_shop/controllers/main_controller.dart';
import 'package:nx_shop/core/my_colors.dart';
import 'package:nx_shop/core/routes/app_routes.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final mainController = Get.find<MainController>();
  final cartontroller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            backgroundColor:
                Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myYellow,
            leading: Container(),
            actions: [
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text('${cartontroller.quantity().toString()}'),
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.CARTSCREEN);
                      },
                      icon: Image.asset('assets/icons/shop.png')),
                ),
              ),
            ],
            title:
                Text(mainController.title[mainController.currentIndex.value]),
            centerTitle: true,
            elevation: 0,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor:
                Get.isDarkMode ? MyColors.darkModeBlack : MyColors.myWhite,
            currentIndex: mainController.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode
                      ? MyColors.myWhite
                      : MyColors.darkModeBlack,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                ),
                icon: Icon(
                  Icons.category,
                  color: Get.isDarkMode
                      ? MyColors.myWhite
                      : MyColors.darkModeBlack,
                ),
                label: 'category',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode
                      ? MyColors.myWhite
                      : MyColors.darkModeBlack,
                ),
                label: 'favorite',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? MyColors.myPink : MyColors.myYellow,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode
                      ? MyColors.myWhite
                      : MyColors.darkModeBlack,
                ),
                label: 'settings',
              ),
            ],
            onTap: (index) {
              mainController.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
              index: mainController.currentIndex.value,
              children: mainController.tabs),
        ),
      ),
    );
  }
}
