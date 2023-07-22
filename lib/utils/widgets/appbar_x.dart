import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/widgets/buttons/back_buttonx.dart';

class AppBarX extends StatelessWidget implements PreferredSizeWidget {
  AppBarX({
    super.key,
    required this.title,
    this.isCenter = true,
    this.bgColor = Colors.transparent,
    this.haveBack = true,
  });

  bool isCenter;
  bool haveBack;
  Widget title;
  Color bgColor;
  Size size = Size(Get.width, 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: bgColor,
      leading: Visibility(
        visible: haveBack,
        child: BackButtonX(),
      ),
      centerTitle: isCenter,
    );
  }

  @override
  Size get preferredSize => size;
}
