import 'package:flutter/material.dart';
import 'package:taxi_top/models/car.dart';

class RidesProvider extends ChangeNotifier {
  List rides = [
    {
      "id": 1,
      "from": "Andijon",
      "to": "Toshkent",
      "time": "10:00",
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
    },
  ];
}
