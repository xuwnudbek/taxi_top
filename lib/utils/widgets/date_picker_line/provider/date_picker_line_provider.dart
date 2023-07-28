import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

class DatePickerLineProvider extends ChangeNotifier {
  var now = DateTime.now();

  //Date ride
  var _selectedDate;
  get selectedDate => _selectedDate;
  set selectedDate(value) {
    _selectedDate = value;
    notifyListeners();
  }

  initDate() {
    selectedDate = now;
  }

  //Time ride
  var _selectedTime;
  get selectedTime => _selectedTime;
  set selectedTime(value) {
    _selectedTime = value;
    notifyListeners();
  }

  initTime() {
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

    selectedTime = Time(hour: hour, minute: minute);
  }

  //Init date and time with Constructor
  DatePickerLineProvider() {
    initDate();
    initTime();
  }
}
