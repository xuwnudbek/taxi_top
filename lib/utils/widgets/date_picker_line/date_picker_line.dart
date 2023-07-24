import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/date_picker_line/provider/date_picker_line_provider.dart';

class DatePickerLine extends StatelessWidget {
  DatePickerLine({
    super.key,
    required this.onChanged,
    required this.type,
  });

  Function onChanged;
  DatePickerLineType type;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DatePickerLineProvider>(
        create: (context) => DatePickerLineProvider(),
        builder: (context, snapshot) {
          var daysRange = Provider.of<DatePickerLineProvider>(context).daysRange;
          var selectedDate = Provider.of<DatePickerLineProvider>(context).selectedDate;

          var time = Provider.of<DatePickerLineProvider>(context).selectedTime;

          return Consumer<DatePickerLineProvider>(builder: (context, provider, _) {
            return Container(
              child: Column(
                children: [
                  type == DatePickerLineType.date
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (var day in daysRange)
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
                                    color: day == selectedDate ? RGBColors.secondaryColor : RGBColors.primaryColor,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: daysRange.first == day ? RGBColors.success : RGBColors.secondaryColor,
                                    ),
                                  ),
                                  child: Text(
                                    day.toString(),
                                    style: TextStyle(
                                      color: day == selectedDate ? RGBColors.primaryColor : RGBColors.lightColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )
                      : Row(),
                ],
              ),
            );
          });
        });
  }
}

enum DatePickerLineType { date, time }
