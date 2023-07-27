import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MainFunc {
  static call(String phone) {
    phone = phone.replaceAll(" ", "");
    var urlLauncher = launchUrlString("tel:${phone}");
  }

 
}
