import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MainFunc {
  static call(String phone) {
    phone = phone.replaceAll(" ", "");
    var urlLauncher = launchUrlString("tel:${phone}");
  }

  String numberToPrice(int price) {
    String priceString = price.toString();
    return NumberFormat("#,###").format(priceString);
  }
}
