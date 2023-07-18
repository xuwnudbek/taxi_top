import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_top/pages/home/views/add_ride/provider/addRide_provider.dart';
import 'package:taxi_top/utils/widgets/buttons/main_button.dart';
import 'package:taxi_top/utils/widgets/cards/main_card.dart';

class AddRide extends StatelessWidget {
  const AddRide({super.key});

  @override
  Widget build(BuildContext context) {
    var rideList = Provider.of<AddRideProvider>(context).rideList;
    var categories = Provider.of<AddRideProvider>(context).categories;

    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          //Add Ride Buttton
          MainButton(
            'add_ride'.tr,
            height: 80,
            child: Container(
              width: Get.width * 0.8,
              child: SvgPicture.asset(
                'assets/images/add.svg',
                width: 50,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            onTap: () {},
          ),
          SizedBox(height: 15),
          //Show my ride list
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("my_rides".tr),
                    Consumer<AddRideProvider>(builder: (context, provider, _) {
                      return _dropDown(
                        categories,
                        value: provider.categoryIndex,
                        onChange: (e) {
                          provider.changeCategory = e;
                        },
                      );
                    }),
                  ],
                ),
                SizedBox(width: 10),
                _buildRideList(rideList)
              ],
            ),
          ),
        ],
      ),
    );
  }

  DropdownButton _dropDown(List<String> categories, {required int value, required Function onChange}) {
    return DropdownButton(
      items: categories.map((e) {
        return DropdownMenuItem(
          child: Text(e),
          value: e,
        );
      }).toList(),
      value: value,
      onChanged: (index) => onChange(index),
    );
  }

  _buildRideList(List<Map<String, dynamic>> rideList) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var ride in rideList)
            MainCard(
              ride: ride,
            ),
        ],
      ),
    );
  }
}
