import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMyRideProvider extends ChangeNotifier {
  //From region
  var _from;
  get from => _from;
  set from(value) {
    _from = value;
    notifyListeners();
  }

  //To region
  var _to;
  get to => _to;
  set to(value) {
    _to = value;
    notifyListeners();
  }

  //Date ride
  var _date;
  get date => _date;
  set date(value) {
    _date = value;
    notifyListeners();
  }

  var time;
  var price;
  var seats;
  var car;

  List<String> regions = [
    "qoraqalpogiston".tr,
    "andijon".tr,
    "buxoro".tr,
    "jizzax".tr,
    "qashqadaryo".tr,
    "navoiy".tr,
    "namangan".tr,
    "samarqand".tr,
    "surxandaryo".tr,
    "sirdaryo".tr,
    "toshkent_sh".tr,
    "fargona".tr,
    "xorazm".tr,
    "toshkent_v".tr,
  ];

  Map<String, dynamic> rider = {
    "id": 1,
    "name": "Abdulaziz",
    "surname": "Abdulazizov",
    "phone": "+998 99 999 99 99",
    "star": 3.5,
    "photo": null,
    "car": {
      "id": 1,
      "model": "Nexi 3",
      "color": "Oq",
      "number": "01 A 987 AA",
      "year": 2021,
      "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
    },
  };
}
