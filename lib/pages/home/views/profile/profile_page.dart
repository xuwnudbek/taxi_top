import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height * 0.2,
          color: Colors.white,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: -Get.width,
                child: Container(
                  width: Get.width,
                  child: CircleAvatar(
                    backgroundColor: RGBColors.primaryColor,
                    maxRadius: Get.width,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: Get.width * 0.33,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/person.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [],
        ),
      ],
    );
  }

  //This is a header for profile
  Widget _header() {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              image: DecorationImage(
                image: AssetImage('assets/images/person.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sardor'.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                ' +998 99 999 99 99',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //This is body for profile
  Widget _body() {
    return Expanded(
      child: Column(
        children: [1, 2, 3, 4, 5]
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: 3.0),
                child: ListTile(
                  onTap: () {},
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hoverColor: RGBColors.lightColor,
                  leading: SvgPicture.asset(
                    'assets/images/profile.svg',
                    color: RGBColors.lightColor,
                    width: 30,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: RGBColors.lightColor,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: RGBColors.lightColor,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
