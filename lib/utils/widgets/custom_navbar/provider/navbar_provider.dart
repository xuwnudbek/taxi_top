import 'package:flutter/material.dart';

class NavbarProvider extends ChangeNotifier {
  List<Map<String, dynamic>> buttons = [
    {
      'activeIcon': 'assets/images/list.svg',
      'label': 'Rides',
      "value": 0,
    },
    {
      'activeIcon': 'assets/images/home.svg',
      'label': 'Home',
      "value": 1,
    },
    {
      'activeIcon': 'assets/images/profile.svg',
      'label': 'Profile',
      "value": 2,
    },
  ];
}
