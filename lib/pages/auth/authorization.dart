import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class Authorization extends StatelessWidget {
  const Authorization({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: RGBColors.primaryColor.withOpacity(0.95),
      child: Center(
        child: _buildAuthCard(),
      ),
    );
  }

  Widget _buildAuthCard() {
    return Container(
      width: 250,
      constraints: BoxConstraints(
        maxHeight: 300,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: RGBColors.grey,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 5,
                  child: Image.asset(
                    "assets/images/card.png",
                    fit: BoxFit.contain,
                    width: 100,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    "assets/images/cross.png",
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Text(
              "un_authorized".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: RGBColors.secondaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            onPressed: () {},
            elevation: 1,
            shape: CircleBorder(),
            color: RGBColors.lightColor.withOpacity(0.9),
            splashColor: RGBColors.lightColor,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                "assets/images/reload.svg",
                color: RGBColors.grey,
                width: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
