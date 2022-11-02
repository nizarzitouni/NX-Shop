import 'package:get/get.dart';

import '../../core/translation/en.dart';
import '../../core/translation/ar.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
