import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainSnackbars {
  static success(String msg) {
    Get.snackbar(
      "success".tr,
      "$msg",
      titleText: Text(
        "success".tr,
        style: Theme.of(Get.context!).textTheme.bodyLarge,
      ),
      messageText: Text(
        "$msg",
        style: Theme.of(Get.context!).textTheme.bodySmall,
      ),
      backgroundColor: Colors.green.withOpacity(0.5),
      duration: Duration(seconds: 2),
      borderRadius: 15,
    );
  }

  static warning(String msg) {
    Get.snackbar(
      "warning".tr,
      "$msg",
      backgroundColor: Colors.orange.withOpacity(0.5),
      duration: Duration(seconds: 2),
      borderRadius: 15,
    );
  }

  static error(String msg) {
    Get.snackbar(
      "error".tr,
      "$msg",
      backgroundColor: Colors.red.withOpacity(0.5),
      duration: Duration(seconds: 2),
      borderRadius: 15,
    );
  }
}
