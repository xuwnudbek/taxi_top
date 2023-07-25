import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        return Consumer<AddMyRideProvider>(
          builder: (context, provider, _) {
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
                          "${provider.rider['car']?['photo']}",
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Title
                            title("ride_details".tr, style: Theme.of(context).textTheme.titleMedium),
                            title("from".tr),
                            _buildRegionDropdown(
                              provider.regions,
                              onChanged: (value) => provider.from = value,
                              value: provider.from,
                            ),
                            //To
                            title("to".tr),
                            _buildRegionDropdown(
                              provider.regions,
                              onChanged: (value) => provider.to = value,
                              value: provider.to,
                            ),
                            //Date
                            title("date".tr),
                            DatePickerLine(
                              onChanged: (value) {
                                provider.date = value;
                              },
                            ),

                            //Price
                            title("price".tr),
                            _buildInput(
                              controller: provider.price,
                            ),
                            //Car
                            title("car".tr),

                            //Seats
                            // title("seats".tr),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildInput({required TextEditingController controller}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: RGBColors.grey,
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        controller: controller,
        textDirection: TextDirection.rtl,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(7),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "price".tr,
          hintStyle: TextStyle(
            color: RGBColors.lightColor.withOpacity(0.3),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          hintTextDirection: TextDirection.rtl,
        ),
        cursorColor: RGBColors.lightColor,
        style: Theme.of(Get.context!).textTheme.bodyMedium,
      ),
    );
  }

  Widget title(String text, {var style}) {
    if (style == null) style = Theme.of(Get.context!).textTheme.titleSmall;

    return Padding(
      padding: EdgeInsets.only(left: 10.0, top: 10, bottom: 5),
      child: Text("$text", style: style),
    );
  }

  Widget _buildRegionDropdown(List<String> regions, {required Function onChanged, required value}) {
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
