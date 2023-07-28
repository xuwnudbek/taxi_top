import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/function/main_function.dart';
import 'package:taxi_top/utils/widgets/main_snackbars.dart';

class AddMyRideProvider extends ChangeNotifier {
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

  initDate() {
    date = DateTime.now();
    notifyListeners();
  }

  //Time ride
  var _time;
  get time => _time;
  set time(value) {
    _time = value;
    notifyListeners();
  }

  initTime() {
    var now = DateTime.now();
    var hour = now.hour;
    var minute = now.minute;

    if (minute >= 45) {
      minute = 0;
      hour = now.add(Duration(hours: 1)).hour;
    } else if (minute >= 30) {
      minute = 45;
    } else if (minute >= 15) {
      minute = 30;
    } else if (minute >= 0) {
      minute = 15;
    }
    notifyListeners();

    time = Time(hour: hour, minute: minute);
  }

  //price
  var price = TextEditingController();

  //seats
  var _seatsCount = 3;
  get seatsCount => _seatsCount;
  set seatsCount(value) {
    if (value == 4) {
      _seatsStatus.addAll({4: true});
      notifyListeners();
    }
    if (value == 3 && _seatsCount == 4) {
      _seatsStatus.remove(4);
    }
    _seatsCount = value;
    notifyListeners();

    print(seatsStatus);
  }

  //Seats statuses
  var _seatsStatus = {};
  get seatsStatus => _seatsStatus;
  set seatStatus(seat) {
    _seatsStatus.addAll(seat);
    notifyListeners();
  }

  AddMyRideProvider() {
    initDate();
    initTime();

    for (var i = 1; i <= _seatsCount; i++) {
      _seatsStatus.addAll({i: true});
      notifyListeners();
    }
  }

  //Add ride
  bool isValidated() {
    if (from == null) {
      MainFunc.showSnackbarX(
        Text("select_from_error".tr),
      );
      return false;
    }
    if (to == null) {
      MainFunc.showSnackbarX(
        Text("select_to_error".tr),
      );
      return false;
    }
    if (date == null) {
      MainFunc.showSnackbarX(
        Text("select_date_error".tr),
      );
      return false;
    }
    if (time == null) {
      MainFunc.showSnackbarX(
        Text("select_time_error".tr),
      );
      return false;
    }
    if (price.text.isEmpty || price.text == 0) {
      MainFunc.showSnackbarX(
        Text("select_price_error".tr),
      );
      return false;
    }
    if (seatsStatus.isEmpty || !seatsStatus.values.contains(true)) {
      MainFunc.showSnackbarX(
        Text("select_seats_error".tr),
      );
      return false;
    }
    ;
    print("IsValidated: true");
    return true;
  }

  bool isLoading = false;

  addRide() async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(seconds: 5));
    MainSnackbars.success("successfully_added".tr);

    isLoading = false;
    notifyListeners();
    return true;
  }
}
