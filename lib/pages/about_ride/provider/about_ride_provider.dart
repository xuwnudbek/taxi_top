import 'package:flutter/material.dart';
import 'package:taxi_top/models/car.dart';

class AboutRideProvider extends ChangeNotifier {
  List<Map<String, dynamic>> rideList = [
    {
      "id": 1,
      "from": "Andijon",
      "to": "Toshkent",
      "time": "10:00",
      "price": 100000,
      "seats": 4,
      "car": Car.fromJson({
        "id": 1,
        "model": "Chevrolet",
        "name": "Lacetti 3",
        "color": "Oq",
        "number": "01 A 123 AA",
        "year": 2015,
        "photo": null,
      }),
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "photo": "assets/images/person.png",
      }
    },
    {
      "id": 2,
      "from": "Farg'ona",
      "to": "Toshkent",
      "time": "12:00",
      "price": 100000,
      "seats": 4,
      "car": Car.fromJson({
        "id": 1,
        "model": "Nexia 3",
        "color": "Oq",
        "number": "01 A 123 AA",
        "year": 2015,
        "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
      }),
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "photo": null,
      }
    },
    {
      "id": 3,
      "from": "Toshkent",
      "to": "Andijon",
      "time": "14:00",
      "price": 100000,
      "seats": 4,
      "car": Car.fromJson({
        "id": 1,
        "model": "Lacetti 3",
        "color": "Oq",
        "number": "01 A 123 AA",
        "year": 2015,
        "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
      }),
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "photo": null,
      }
    },
    {
      "id": 4,
      "from": "Toshkent",
      "to": "Namangan",
      "time": "22:00",
      "price": 100000,
      "seats": 4,
      "car": Car.fromJson({
        "id": 1,
        "model": "Lacetti 3",
        "color": "Oq",
        "number": "01 A 123 AA",
        "year": 2015,
        "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
      }),
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "photo": null,
      }
    },
    {
      "id": 5,
      "from": "Farg'ona",
      "to": "Samarqand",
      "time": "01:00",
      "price": 200000,
      "seats": 2,
      "car": Car.fromJson({
        "id": 1,
        "model": "Lacetti 3",
        "color": "Oq",
        "number": "01 A 123 AA",
        "year": 2015,
        "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
      }),
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "photo": null,
      }
    },
    {
      "id": 6,
      "from": "Farg'ona",
      "to": "Xorazm",
      "time": "03:00",
      "price": 170000,
      "seats": 3,
      "car": Car.fromJson({
        "id": 1,
        "model": "Nexi 3",
        "color": "Oq",
        "number": "01 A 987 AA",
        "year": 2021,
        "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
      }),
      "rider": {
        "id": 1,
        "name": "Abdulaziz",
        "surname": "Abdulazizov",
        "phone": "+998 99 999 99 99",
        "photo": null,
      }
    },
  ];

  Map<String, dynamic> ride = {};

  int rideId;
  bool isLoading = false;

  AboutRideProvider(this.rideId) {
    getRide(rideId);
  }

  getRide(int id) async {
    isLoading = true;
    notifyListeners();

    await Future.delayed(Duration(milliseconds: 700));
    ride = rideList.elementAt(id);

    isLoading = false;
    notifyListeners();
  }
}
