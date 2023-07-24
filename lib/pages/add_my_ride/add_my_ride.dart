import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/add_my_ride/provider/add_my_ride_provider.dart';
import 'package:taxi_top/utils/cp_indicator.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/appbar_x.dart';
import 'package:taxi_top/utils/widgets/date_picker_line/date_picker_line.dart';

class AddMyRide extends StatelessWidget {
  const AddMyRide({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddMyRideProvider>(
      create: (context) => AddMyRideProvider(),
      builder: (context, snapshot) {
        var rider = Provider.of<AddMyRideProvider>(context).rider;
        var regions = Provider.of<AddMyRideProvider>(context).regions;

        return Scaffold(
          appBar: AppBarX(
            title: Text(
              "add_ride".tr,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Rider's car image
                  Container(
                    decoration: BoxDecoration(
                      color: RGBColors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    constraints: BoxConstraints(maxHeight: 300),
                    child: Image.network(
                      "${rider['car']?['photo']}",
                      fit: BoxFit.cover,
                      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: child,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CPIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  //Form ride
                  SizedBox(height: 10),
                  Container(
                    child: Consumer<AddMyRideProvider>(builder: (context, provider, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Title
                          title("ride_details".tr, style: Theme.of(context).textTheme.titleMedium),
                          title("from".tr),
                          _buildDropdown(
                            regions,
                            onChanged: (value) => provider.from = value,
                            value: provider.from,
                          ),
                          //To
                          title("to".tr),
                          _buildDropdown(
                            regions,
                            onChanged: (value) => provider.to = value,
                            value: provider.to,
                          ),
                          //Date
                          title("date".tr),
                          DatePickerLine(
                            type: DatePickerLineType.date,
                            onChanged: (value) {
                              provider.date = value;
                            },
                          ),
                          //Time
                          title("time".tr),
                          DatePickerLine(
                            type: DatePickerLineType.time,
                            onChanged: (value) {
                              provider.time = value;
                            },
                          ),

                          //Price
                          title("price".tr),

                          //Car
                          title("car".tr),

                          //Seats
                          title("seats".tr),
                        ],
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget title(String text, {var style}) {
    if (style == null) style = Theme.of(Get.context!).textTheme.titleSmall;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 5),
      child: Text("$text", style: style),
    );
  }

  Widget _buildDropdown(List<String> regions, {required Function onChanged, required value}) {
    return DropdownButton(
      dropdownColor: RGBColors.primaryColor,
      isExpanded: true,
      value: value,
      items: regions
          .map((e) => DropdownMenuItem(
                enabled: true,
                child: Text(e, style: Theme.of(Get.context!).textTheme.bodyMedium),
                value: e,
              ))
          .toList(),
      onChanged: (value) => onChanged(value),
    );
  }
}
