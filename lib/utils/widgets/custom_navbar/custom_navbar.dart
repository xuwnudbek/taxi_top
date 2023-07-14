import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class CustomNavbar extends StatelessWidget {
  CustomNavbar({super.key});

  List<Map<String, dynamic>> buttons = [
    {
      'activeIcon': 'assets/images/home-in.svg',
      'unActiveIcon': 'assets/images/home.svg',
      'label': 'Home',
    },
    {
      'icon': 'assets/images/heart-in.svg',
      'iconActive': 'assets/images/heart.svg',
      'label': 'Favoritos',
    },
    {
      'icon': 'assets/images/user-in.svg',
      'iconActive': 'assets/images/user.svg',
      'label': 'Perfil',
    },
  ];

  /*
  Expanded(
    child: MaterialButton(
      onPressed: () {},
      child: SvgPicture.asset(
        'assets/images/home-in.svg',
        width: 35,
      ),
    ),
  ),
  */

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: RGBColors.secondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [],
        ),
      ),
    );
  }
}
