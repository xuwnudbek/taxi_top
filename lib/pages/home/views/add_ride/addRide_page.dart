// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/about_ride/about_ride.dart';
import 'package:taxi_top/pages/add_my_ride/add_my_ride.dart';
import 'package:taxi_top/pages/auth/authorization.dart';
import 'package:taxi_top/pages/home/views/add_ride/provider/addRide_provider.dart';
import 'package:taxi_top/utils/rgb_colors.dart';
import 'package:taxi_top/utils/widgets/buttons/main_button.dart';
import 'package:taxi_top/utils/widgets/cards/main_ride_card.dart';

class AddRide extends StatelessWidget {
  const AddRide({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddRideProvider>(builder: (ctx, provider, _) {
      var rider = provider.rider;
      var rideList = provider.rideList;
      var categories = provider.categories;

      return Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Flex(
              direction: Axis.vertical,
              children: [
                //Add Ride Buttton
                MainButton(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "add_ride".tr,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  onTap: () async {
                    var res = await Get.to(() => AddMyRide());
                    if (res ?? false) {
                      await provider.refresh();
                    }
                  },
                ),
                //Show my ride list
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("my_rides".tr),
                              _dropDown(
                                categories,
                                value: provider.categoryIndex,
                                onChange: (e) {
                                  provider.changeCategory = e;
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: RefreshIndicator(
                            displacement: 7,
                            child: _buildRideList(rideList),
                            onRefresh: () async {
                              await provider.refresh();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: rider['is_rider'] == false,
            child: Authorization(),
          ),
        ],
      );
    });
  }

  DropdownButton _dropDown(List<String> categories, {required int value, required Function onChange}) {
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

  _buildRideList(List<Map<String, dynamic>> rideList) {
    return ListView(
      children: [
        for (var ride in rideList)
          GestureDetector(
            onTap: () => Get.to(
              () => AboutRide(ride["id"]),
              transition: Transition.native,
              duration: Duration(milliseconds: 300),
            ),
            child: MainRideCard(
              ride: ride,
            ),
          ),
      ],
    );
  }
}
