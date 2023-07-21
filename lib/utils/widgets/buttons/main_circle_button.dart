import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class MainCircleBtn extends StatelessWidget {
  MainCircleBtn({super.key, required this.onPressed, required this.child, this.color = RGBColors.success});

  Function onPressed;
  Widget child;
  Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: color,
      onPressed: () => onPressed(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(color),
      ),
      icon: SvgPicture.asset("assets/images/call.svg"),
    );
  }
}
