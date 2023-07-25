import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/date_picker_line/provider/date_picker_line_provider.dart';

class DatePickerLine extends StatelessWidget {
  DatePickerLine({
    super.key,
    required this.onChanged,
  });

  Function onChanged;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatePickerLineProvider>(
        create: (context) => DatePickerLineProvider(),
        builder: (context, snapshot) {
          return Consumer<DatePickerLineProvider>(builder: (context, provider, _) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var day in provider.daysRange)
                        GestureDetector(
                          onTap: () {
                            onChanged(day);
                            provider.selectedDate = day;
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 2.5),
                            constraints: BoxConstraints(minHeight: 40, minWidth: 40),
                            decoration: BoxDecoration(
                              color: day == provider.selectedDate ? RGBColors.secondaryColor : RGBColors.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: provider.daysRange.first == day ? RGBColors.success : RGBColors.secondaryColor,
                              ),
                            ),
                            child: Text(
                              "${day}",
                              style: TextStyle(
                                color: day == provider.selectedDate ? RGBColors.primaryColor : RGBColors.lightColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title("time".tr),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDropdown(
                        provider.hoursRange,
                        onChanged: (value) {
                          provider.selectedHour = value;
                          onChanged({"hour": provider.selectedHour, "minute": provider.selectedMinute});
                        },
                        selectedTime: provider.selectedHour,
                      ),
                      SizedBox(width: 20),
                      _buildDropdown(
                        provider.minutesRange,
                        onChanged: (value) {
                          provider.selectedMinute = value;
                          onChanged({"hour": provider.selectedHour, "minute": provider.selectedMinute});
                        },
                        selectedTime: provider.selectedMinute,
                      ),
                    ],
                  ),
                ],
              ),
            );
          });
        });
  }

  Widget _buildDropdown(
    List items, {
    required Function onChanged,
    required int selectedTime,
  }) {
    return DropdownButton(
      value: selectedTime,
      onChanged: (value) => onChanged(value),
      alignment: Alignment.center,
      dropdownColor: RGBColors.primaryColor,
      menuMaxHeight: Get.height * 0.4,
      borderRadius: BorderRadius.circular(10),
      items: [
        for (var item in items)
          DropdownMenuItem(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text("${item < 10 ? "0" : ""}$item"),
            ),
            value: item,
          ),
      ],
    );
  }

  Widget title(String text, {var style}) {
    if (style == null) style = Theme.of(Get.context!).textTheme.titleSmall;
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10),
      child: Text("$text", style: style),
    );
  }
}

enum DatePickerLineType { date, time }
