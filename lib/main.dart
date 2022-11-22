import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_shop/core/my_strings.dart';
import 'package:nx_shop/core/translation/localization_app.dart';
import 'data/services/dependency_injection.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'core/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependecyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Nx_shop',
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      themeMode: ThemeController().themeDataGet,
      //ThemeService.instance.themeMode,
      translations: LocaliztionApp(),
      locale: Locale(GetStorage().read<String>('Lang').toString()),
      fallbackLocale: Locale(ene),
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
          ? AppRoutes.MAINSCREEN
          : AppRoutes.WELCOMESCREEN,
      getPages: AppPages.pages,
    );
  }
}
