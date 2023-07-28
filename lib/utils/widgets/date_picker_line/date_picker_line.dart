import 'dart:developer';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/buttons/main_button.dart';
import 'package:taxi_top/utils/widgets/cards/main_card.dart';
import 'package:taxi_top/utils/widgets/date_picker_line/provider/date_picker_line_provider.dart';

class DatePickerLine extends StatelessWidget {
  DatePickerLine({
    super.key,
    required this.onChangeDate,
    required this.onChangeTime,
  });

  Function onChangeDate;
  Function onChangeTime;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatePickerLineProvider>(
        create: (context) => DatePickerLineProvider(),
        builder: (context, snapshot) {
          return Consumer<DatePickerLineProvider>(builder: (context, provider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title("date".tr),
                MainCard(
                  child: selectDate(provider),
                ),
                title("time".tr),
                MainCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "${provider.selectedTime.hour < 10 ? "0" : ""}${provider.selectedTime.hour}:${provider.selectedTime.minute < 10 ? "0" : ""}${provider.selectedTime.minute}",
                            style: TextStyle(
                              fontSize: 40,
                              color: RGBColors.grey,
                            ),
                          ),
                        ),
                      ),
                      MainButton(
                        child: Row(
                          children: [
                            Text(
                              "select_time".tr,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            selectTime(provider),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
        });
  }

  selectDate(DatePickerLineProvider provider) {
    return DatePicker(
      provider.now,
      onDateChange: (selectedDate) {
        provider.selectedDate = selectedDate;
        onChangeDate(selectedDate);
      },
      dateTextStyle: TextStyle(
        fontSize: 16,
        color: RGBColors.grey,
      ),
      daysCount: 7,
      initialSelectedDate: provider.selectedDate,
      selectionColor: RGBColors.secondaryColor,
      selectedTextColor: RGBColors.grey,
      locale: "uz",
    );
  }

  selectTime(DatePickerLineProvider provider) {
    var context = Get.context!;
    return showPicker(
      context: context,
      value: provider.selectedTime,
      blurredBackground: true,
      minuteInterval: TimePickerInterval.FIFTEEN,
      accentColor: RGBColors.secondaryColor,
      okStyle: Theme.of(context).textTheme.titleSmall!,
      //Time Data
      okText: "choose".tr,
      buttonStyle: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(RGBColors.grey),
      ),
      buttonsSpacing: 10,
      cancelText: "cancel".tr,
      cancelStyle: Theme.of(context).textTheme.titleSmall!,
      onChange: (value) {
        provider.selectedTime = value;
        onChangeTime(provider.selectedTime);
      },
      is24HrFormat: true,
    );
  }

  // Widget _buildDropdown(
  //   List items, {
  //   required Function onChanged,
  //   required int selectedTime,
  // }) {
  //   return DropdownButton(
  //     value: selectedTime,
  //     onChanged: (value) => onChanged(value),
  //     alignment: Alignment.center,
  //     dropdownColor: RGBColors.primaryColor,
  //     menuMaxHeight: Get.height * 0.4,
  //     borderRadius: BorderRadius.circular(10),
  //     items: [
  //       for (var item in items)
  //         DropdownMenuItem(
  //           child: Padding(
  //             padding: EdgeInsets.only(left: 15.0),
  //             child: Text("${item < 10 ? "0" : ""}$item"),
  //           ),
  //           value: item,
  //         ),
  //     ],
  //   );
  // }

  Widget title(String text, {var style}) {
    if (style == null) style = Theme.of(Get.context!).textTheme.titleSmall;
    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10),
      child: Text("$text", style: style),
    );
  }
}

enum DatePickerLineType { date, time }
