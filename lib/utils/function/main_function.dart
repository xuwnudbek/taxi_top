import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MainFunc {
  static call(String phone) {
    phone = phone.replaceAll(" ", "");
    launchUrlString("tel:${phone}");
  }

  static showSnackbarX(Widget content) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: content,
        duration: Duration(seconds: 2),
        backgroundColor: RGBColors.grey,
        showCloseIcon: true,
        closeIconColor: RGBColors.lightColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
