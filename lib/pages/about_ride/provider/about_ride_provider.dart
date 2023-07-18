import 'package:flutter/material.dart';
import 'package:taxi_top/models/car.dart';

class AboutRideProvider extends ChangeNotifier {
  Map<String, dynamic> ride = {
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
      "photo": "https://www.autostrada.uz/wp-content/uploads/2018/02/Chevrolet-Nexia-R3-Baklazhan-880x587.jpg",
    }),
  };

  getRide(int id) {}
}
