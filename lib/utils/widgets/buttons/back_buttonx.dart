import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class BackButtonX extends StatelessWidget {
  const BackButtonX({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: InkWell(
        onTap: () => Get.back(),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            "assets/images/back.svg",
            width: 10,
            color: RGBColors.lightColor,
          ),
        ),
      ),
    );
  }
}
