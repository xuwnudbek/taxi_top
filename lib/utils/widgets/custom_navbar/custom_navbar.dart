import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/home/provider/home_provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/custom_navbar/provider/navbar_provider.dart';

class CustomNavbar extends StatelessWidget {
  CustomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarProvider>(builder: (context, provider, _) {
      return Padding(
        padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
        child: Container(
          decoration: BoxDecoration(
            color: RGBColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          // padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: provider.buttons
                .map(
                  (button) => _buildButton(button),
                )
                .toList(),
          ),
        ),
      );
    });
  }

  Widget _buildButton(Map button) {
    var value = button['value'];

    return Consumer<HomeProvider>(builder: (ctx, homeProvider, _) {
      return Expanded(
        child: Container(
          height: 60,
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: homeProvider.currentIndex == value ? RGBColors.lightColor : RGBColors.transparent,
            borderRadius: BorderRadius.circular(18),
          ),
          child: MaterialButton(
            highlightColor: RGBColors.transparent,
            splashColor: RGBColors.transparent,
            onPressed: () {
              homeProvider.changeIndex = value;
            },
            child: SvgPicture.asset(
              button['activeIcon'],
              color: RGBColors.primaryColor,
              width: 40,
            ),
          ),
        ),
      );
    });
  }
}
