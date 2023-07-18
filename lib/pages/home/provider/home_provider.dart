import 'package:flutter/material.dart';
import 'package:taxi_top/pages/home/views/add_ride/addRide_page.dart';
import 'package:taxi_top/pages/home/views/rides/rides_page.dart';
import 'package:taxi_top/pages/home/views/profile/profile_page.dart';

class HomeProvider extends ChangeNotifier {
  List<String> titles = [
    'Rides',
    'Add Ride',
    'Profile',
  ];
  List<Widget> pages = [
    RidesPage(),
    AddRide(),
    ProfilePage(),
  ];

  int currentIndex = 1;

  set changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
