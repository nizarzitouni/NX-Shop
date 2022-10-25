import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/data/services/dependency_injection.dart';
import 'app/data/services/theme_service.dart';
import 'app/data/services/translations_service.dart';
import 'core/routes/app_pages.dart';
import 'core/routes/app_routes.dart';
import 'app/ui/theme/themes.dart';

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
      translations: Translation(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      initialRoute: AppRoutes.WELCOMESCREEN,
      getPages: AppPages.pages,
    );
  }
}
