import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class CPIndicator extends StatelessWidget {
  const CPIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: RGBColors.grey.withOpacity(0.7),
      ),
      child: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          maxHeight: 65,
          maxWidth: 65,
        ),
        decoration: BoxDecoration(
          color: RGBColors.lightColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: LoadingAnimationWidget.threeArchedCircle(
          color: RGBColors.secondaryColor,
          size: 28,
        ),
      ),
    );
  }
}
