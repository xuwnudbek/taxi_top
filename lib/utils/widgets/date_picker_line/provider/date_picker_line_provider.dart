import 'package:flutter/material.dart';

class DatePickerLineProvider extends ChangeNotifier {
  var now = DateTime.now();

  //Date
  List<int> daysRange = [];
  void setDaysRange() {
    daysRange.clear();

    var daysInCurrentMonth = DateTime(now.year, now.month + 1, 0);

    var a = daysInCurrentMonth.day - now.day + 1;
    var b = 7 - a;

    if (a < 7) {
      for (var i = 0; i < a; i++) {
        daysRange.add(now.day + i);
      }

      for (var i = 1; i <= b; i++) {
        daysRange.add(i);
      }
    } else {
      for (var i = 0; i < 7; i++) {
        daysRange.add(now.day + i);
      }
    }
  }

  var _selectedDate;
  get selectedDate => _selectedDate;
  set selectedDate(value) {
    _selectedDate = value;
    notifyListeners();
  }

  //Time
  List<int> hoursRange = [];
  setHoursRange() {
    var currentHour = now.hour;
    var n = 24 - currentHour;
    var m = 24 - n;

    for (var i = 0; i < n; i++) {
      hoursRange.add(currentHour + i);
    }

    print(hoursRange);
  }

  get selectedTime => "$hour:$minute";
  var hour;
  var minute;

  DatePickerLineProvider() {
    //Date
    setDaysRange();
    selectedDate = daysRange[0];
    //Time
    setHoursRange();
  }
}
