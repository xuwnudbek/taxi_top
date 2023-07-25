import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePickerLineProvider extends ChangeNotifier {
  var now = DateTime.now();

  DatePickerLineProvider() {
    setDaysRange();
    selectedDate = daysRange[0];
    setHoursRange();
  }

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
    setHoursRange();
  }

  //Time
  List<int> hoursRange = [];
  List<int> minutesRange = [0, 15, 30, 45];
  setHoursRange() {
    hoursRange.clear();
    var currentHour = now.hour;
    var to24 = 24 - currentHour;

    if (selectedDate != now.day) {
      hoursRange = List.generate(24, (index) => index);
    } else {
      if (selectedHour == now.day && minutesRange.firstWhereOrNull((element) => selectedMinute > element) == null) {
        hoursRange = List.generate(24, (index) => index);
      } else {
        for (var i = 0; i < to24; i++) {
          hoursRange.add(currentHour + i);
        }
      }
    }
    notifyListeners();
    initTime();
  }

  var _selectedHour;
  get selectedHour => _selectedHour;
  set selectedHour(value) {
    _selectedHour = value;
    notifyListeners();
  }

  var _selectedMinute;
  get selectedMinute => _selectedMinute;
  set selectedMinute(value) {
    _selectedMinute = value;
    notifyListeners();
  }

  initTime() {
    if (selectedDate == now.day) {
      selectedHour = hoursRange.first;
      selectedMinute = minutesRange.firstWhere(
        (element) => element > now.minute,
        orElse: () {
          selectedHour = hoursRange[1];
          return minutesRange.first;
        },
      );
    } else {
      selectedHour = hoursRange.first;
      selectedMinute = minutesRange.first;
    }
    notifyListeners();
  }
}
