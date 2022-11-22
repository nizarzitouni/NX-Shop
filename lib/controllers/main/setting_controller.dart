import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_shop/core/my_strings.dart';
import 'package:nx_shop/core/translation/fr.dart';

class SettingController extends GetxController {
  var swithchValue = false.obs;

  var storage = GetStorage();
  late var langLocale;

  @override
  void onInit() async {
    super.onInit();
    langLocale = await getLanguage;
  }

  //~~~~~~~~~~~~~~Capitlize the first char of name~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  String capitalize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join((" "));
  }

  //~~~~~~~~~~~~~~Localization~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  void saveLanguage(String lang) async {
    await storage.write('Lang', lang);
  }

  Future<String> get getLanguage async {
    return await storage.read('Lang') ?? ene;
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocale == typeLang) {
      return;
    }

    if (typeLang == fr) {
      langLocale = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      langLocale = ara;
      saveLanguage(ara);
    } else {
      langLocale = ene;
      saveLanguage(ene);
    }

    update();
  }
}
