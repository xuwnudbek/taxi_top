import 'package:get/get.dart';
import 'package:taxi_top/controller/language/ru.dart';
import 'package:taxi_top/controller/language/uz.dart';

class Messages extends Translations {
  Map<String, Map<String, String>> get keys => {
        "uz": uz,
        "ru": ru,
      };
}
