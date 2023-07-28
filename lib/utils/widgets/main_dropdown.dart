import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:taxi_top/utils/rgb_colors.dart';

class MainDropdown extends StatelessWidget {
  MainDropdown({
    super.key,
    required this.categories,
    required this.value,
    required this.onChange(value),
  });

  List<String> categories;
  int value;
  Function onChange;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(10),
      dropdownColor: RGBColors.grey,
      focusColor: RGBColors.lightColor,
      items: categories.map((e) {
        return DropdownMenuItem(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                "assets/images/right.svg",
                color: RGBColors.secondaryColor,
              ),
              SizedBox(width: 5),
              Text(
                "${e}",
                style: Theme.of(Get.context!).textTheme.titleSmall,
              ),
            ],
          ),
          value: categories.indexOf(e),
        );
      }).toList(),
      value: value,
      onChanged: (index) => onChange(index),
    );
  }
}
