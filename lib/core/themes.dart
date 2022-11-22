import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_shop/core/my_colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: MyColors.myYellow,
    backgroundColor: MyColors.myWhite,
    cardColor: MyColors.myWhite,
    scaffoldBackgroundColor: Colors.grey[200],
    shadowColor: Colors.grey,
    brightness: Brightness.light,
  );
  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: MyColors.myPink,
    backgroundColor: MyColors.darkModeBlack,
    cardColor: Colors.grey[900],
    scaffoldBackgroundColor: Colors.grey[800],
    shadowColor: Colors.grey,
    brightness: Brightness.dark,
  );
}

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDark';

  saveDataInBo(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool get getThemDataFromBox => boxStorage.read<bool>(key) ?? false;

  ThemeMode get themeDataGet =>
      getThemDataFromBox ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(getThemDataFromBox ? ThemeMode.light : ThemeMode.dark);
    saveDataInBo(!getThemDataFromBox);
  }
}
