import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:nx_shop/core/my_strings.dart';
import 'package:nx_shop/core/translation/ar.dart';
import 'package:nx_shop/core/translation/en.dart';
import 'package:nx_shop/core/translation/fr.dart';

class LocaliztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        frf: fr,
      };
}
