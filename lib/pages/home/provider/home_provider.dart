import 'package:flutter/material.dart';
import 'package:taxi_top/pages/home/views/menu/menu_page.dart';
import 'package:taxi_top/pages/home/views/rides/rides_page.dart';
import 'package:taxi_top/pages/home/views/profile/profile_page.dart';

class HomeProvider extends ChangeNotifier {
  List<String> titles = [
    'Rides',
    'Menu',
    'Profile',
  ];
  List<Widget> pages = [
    RidesPage(),
    MenuPage(),
    ProfilePage(),
  ];

  int currentIndex = 1;

  set changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
