import 'package:flutter/material.dart';

class AboutRideProvider extends ChangeNotifier {
  List<Map<String, dynamic>> rideList = [
    {
      "id": 1,
      "from": "Andijon",
      "to": "Toshkent",
      "time": "10:00",
      "price": 100000,
      "seats": 4,
      "date": "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "star": 3.5,
        "photo": null,
        "car": {
          "id": 1,
          "model": "Chevrolet Spark 4",
          "color": "Oq",
          "name": "Lacetti 3",
          "number": "01 A 123 AA",
          "year": 2015,
          "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
        },
      }
    },
    {
      "id": 2,
      "from": "Farg'ona",
      "to": "Toshkent",
      "time": "12:00",
      "price": 100000,
      "seats": 4,
      "date": "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "star": 3.5,
        "photo": null,
        "car": {
          "id": 1,
          "model": "Nexia 3",
          "color": "Oq",
          "number": "01 A 123 AA",
          "year": 2015,
          "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
        },
      }
    },
    {
      "id": 3,
      "from": "Toshkent",
      "to": "Andijon",
      "time": "14:00",
      "price": 100000,
      "seats": 4,
      "date": "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "star": 3.5,
        "photo": null,
        "car": {
          "id": 1,
          "model": "Lacetti 3",
          "color": "Oq",
          "number": "01 A 123 AA",
          "year": 2015,
          "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
        },
      }
    },
    {
      "id": 4,
      "from": "Toshkent",
      "to": "Namangan",
      "time": "22:00",
      "price": 100000,
      "seats": 4,
      "date": "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "star": 3.5,
        "photo": null,
        "car": {
          "id": 1,
          "model": "Lacetti 3",
          "color": "Oq",
          "number": "01 A 123 AA",
          "year": 2015,
          "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
        },
      }
    },
    {
      "id": 5,
      "from": "Farg'ona",
      "to": "Samarqand",
      "time": "01:00",
      "price": 200000,
      "seats": 2,
      "date": "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "star": 3.5,
        "photo": null,
        "car": {
          "id": 1,
          "model": "Lacetti 3",
          "color": "Oq",
          "number": "01 A 123 AA",
          "year": 2015,
          "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
        },
      }
    },
    {
      "id": 6,
      "from": "Farg'ona",
      "to": "Xorazm",
      "time": "03:00",
      "price": 170000,
      "seats": 3,
      "date": "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
      "rider": {
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
      }
    },
  ];
  Map<String, dynamic> ride = {};
  bool isLoading = false;
  int rideId;

  //Seats statuses
  var _seatsStatus = {
    1: false,
    2: false,
    3: false,
    4: false,
  };
  get seatsStatus => _seatsStatus;

  var selectedSeat;
  var _isSingle = true;
  get isSingle => _isSingle;
  set isSingle(value) {
    _isSingle = value;
    notifyListeners();
  }

  //Default Constructors
  AboutRideProvider(this.rideId) {
    getRide(rideId);
  }

  //Main Functions
  getRide(int id) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 700));
    ride = rideList.firstWhere((element) => element["id"] == id);

    isLoading = false;
    notifyListeners();
  }
}
